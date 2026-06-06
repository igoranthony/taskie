import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/widgets/app_primary_button.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/create_project.dart';
import '../../domain/usecases/update_project.dart';
import '../bloc/project_form/project_form_bloc.dart';
import '../bloc/project_form/project_form_event.dart';
import '../bloc/project_form/project_form_state.dart';
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
    return BlocProvider(
      create: (_) => ProjectFormBloc(
        createProject: getIt<CreateProject>(),
        updateProject: getIt<UpdateProject>(),
      ),
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

  bool get _isEditing => widget.initialProject != null;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.initialProject?.nome ?? '');
    _cor = widget.initialProject?.cor ?? _projectColors.first;
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
        ));
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
            context.pop(project);
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
