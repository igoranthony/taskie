import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/app_primary_button.dart';
import '../../../../shared/widgets/app_select_field.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/create_category.dart';
import '../../domain/usecases/create_project.dart';
import '../../domain/usecases/delete_category.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/update_category.dart';
import '../../domain/usecases/update_project.dart';
import '../../domain/usecases/upload_project_logo.dart';
import '../bloc/project_form/project_form_bloc.dart';
import '../bloc/project_form/project_form_event.dart';
import '../bloc/project_form/project_form_state.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';
import '../widgets/project_form_header.dart';

const _projectColors = <String>[
  '#7c6af7',
  '#10b981',
  '#f59e0b',
  '#ef4444',
  '#3b82f6',
  '#ec4899',
  '#14b8a6',
  '#64748b',
];

class ProjectFormPage extends StatelessWidget {
  final Project? initialProject;

  const ProjectFormPage({super.key, this.initialProject});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProjectFormBloc(
            createProject: getIt<CreateProject>(),
            updateProject: getIt<UpdateProject>(),
          ),
        ),
        BlocProvider(
          create: (_) => CategoriesCubit(
            getCategories: getIt<GetCategories>(),
            createCategory: getIt<CreateCategory>(),
            updateCategory: getIt<UpdateCategory>(),
            deleteCategory: getIt<DeleteCategory>(),
          )..load(),
        ),
      ],
      child: _ProjectFormView(initialProject: initialProject),
    );
  }
}

class _ProjectFormView extends StatefulWidget {
  final Project? initialProject;

  const _ProjectFormView({this.initialProject});

  @override
  State<_ProjectFormView> createState() => _ProjectFormViewState();
}

class _ProjectFormViewState extends State<_ProjectFormView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomeController;
  late String _cor;
  String? _categoriaId;
  String? _logoUrlOverride; // após upload bem-sucedido
  bool _uploadingLogo = false;

  bool get _isEditing => widget.initialProject != null;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.initialProject?.nome ?? '');
    _cor = widget.initialProject?.cor ?? _projectColors.first;
    _categoriaId = widget.initialProject?.categoriaId;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<ProjectFormBloc>().add(ProjectFormEvent.submitted(
          initial: widget.initialProject,
          nome: _nomeController.text.trim(),
          cor: _cor,
          categoriaId: _categoriaId,
        ));
  }

  Future<void> _pickLogo() async {
    final initial = widget.initialProject;
    if (initial == null) return;
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null || result.files.single.path == null) return;
    if (!mounted) return;
    setState(() => _uploadingLogo = true);
    try {
      final updated = await getIt<UploadProjectLogo>().call(
        initial.id,
        File(result.files.single.path!),
      );
      if (mounted) {
        setState(() {
          _logoUrlOverride = updated.logoUrl;
          _uploadingLogo = false;
        });
        AppSnackbar.success(context, 'Logo atualizado.');
      }
    } catch (_) {
      if (mounted) {
        setState(() => _uploadingLogo = false);
        AppSnackbar.error(context, 'Erro ao enviar logo.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectFormBloc, ProjectFormState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (project) {
            AppSnackbar.success(
              context,
              _isEditing ? 'Projeto atualizado.' : 'Projeto criado.',
            );
            // Propaga override de logo (se houve upload) pro retorno
            final merged = _logoUrlOverride != null
                ? project.copyWith(logoUrl: _logoUrlOverride)
                : project;
            context.pop(merged);
          },
          failure: (message) => AppSnackbar.error(context, message),
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              ProjectFormHeader(isEditing: _isEditing),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                    children: [
                      if (_isEditing) ...[
                        _LogoAvatar(
                          logoUrl:
                              _logoUrlOverride ?? widget.initialProject?.logoUrl,
                          accent: _cor,
                          isUploading: _uploadingLogo,
                          onTap: _uploadingLogo ? null : _pickLogo,
                        ),
                        const SizedBox(height: 24),
                      ],
                      AppTextField(
                        controller: _nomeController,
                        label: 'Nome do projeto',
                        hint: 'Ex: Lançamento mobile',
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Informe um nome'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Cor',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _ColorPicker(
                        selected: _cor,
                        onChanged: (c) => setState(() => _cor = c),
                      ),
                      const SizedBox(height: 16),
                      _CategoryField(
                        selectedId: _categoriaId,
                        onChanged: (id) => setState(() => _categoriaId = id),
                      ),
                      const SizedBox(height: 32),
                      BlocBuilder<ProjectFormBloc, ProjectFormState>(
                        builder: (context, state) {
                          final loading = state is ProjectFormLoading;
                          return AppPrimaryButton(
                            label: _isEditing ? 'Salvar alterações' : 'Criar projeto',
                            onPressed: loading ? null : _submit,
                            isLoading: loading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryField extends StatelessWidget {
  final String? selectedId;
  final ValueChanged<String?> onChanged;

  const _CategoryField({required this.selectedId, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final loading =
            state is CategoriesInitial || state is CategoriesLoading;
        final List<Category> categories =
            state is CategoriesLoaded ? state.categories : const [];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: AppSelectField<String?>(
                label: 'Categoria',
                value: categories.any((c) => c.id == selectedId)
                    ? selectedId
                    : null,
                loading: loading,
                options: [
                  const AppSelectOption(value: null, label: 'Sem categoria'),
                  ...categories.map(
                    (c) => AppSelectOption(value: c.id, label: c.nome),
                  ),
                ],
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 8),
            _ManageCategoriesButton(),
          ],
        );
      },
    );
  }
}

class _ManageCategoriesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          await context.push(AppRoutes.categories);
          if (context.mounted) {
            await context.read<CategoriesCubit>().load();
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(Icons.tune, size: 18, color: cs.onSurface),
        ),
      ),
    );
  }
}

class _LogoAvatar extends StatelessWidget {
  final String? logoUrl;
  final String accent;
  final bool isUploading;
  final VoidCallback? onTap;

  const _LogoAvatar({
    required this.logoUrl,
    required this.accent,
    required this.isUploading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final accentColor = _parseHex(accent) ?? cs.primary;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
                image: logoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(logoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: logoUrl == null
                  ? Icon(Icons.folder_outlined, size: 36, color: accentColor)
                  : null,
            ),
            if (isUploading)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: cs.onPrimary,
                      ),
                    ),
                  ),
                ),
              )
            else
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: cs.surface, width: 2),
                  ),
                  child: Icon(Icons.edit, size: 14, color: cs.onPrimary),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color? _parseHex(String hex) {
    final clean = hex.replaceAll('#', '').trim();
    if (clean.length != 6) return null;
    final value = int.tryParse('FF$clean', radix: 16);
    return value == null ? null : Color(value);
  }
}

class _ColorPicker extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _ColorPicker({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _projectColors.map((hex) {
        final color = _parseHex(hex) ?? Theme.of(context).colorScheme.primary;
        final isSelected = hex.toLowerCase() == selected.toLowerCase();
        return GestureDetector(
          onTap: () => onChanged(hex),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.transparent,
                width: 3,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : null,
          ),
        );
      }).toList(),
    );
  }

  Color? _parseHex(String hex) {
    final clean = hex.replaceAll('#', '').trim();
    if (clean.length != 6) return null;
    final value = int.tryParse('FF$clean', radix: 16);
    return value == null ? null : Color(value);
  }
}
