import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/task.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../features/authentication/domain/entities/user_summary.dart';
import '../../../../../features/authentication/presentation/cubit/users_cubit.dart';
import '../../../../../features/authentication/presentation/cubit/users_state.dart';
import '../../../../../shared/widgets/app_text_field.dart';
import '../../../../../shared/widgets/app_select_field.dart';
import '../../../../../shared/widgets/app_date_picker_field.dart';
import '../../../../../shared/widgets/app_time_picker_field.dart';
import '../../../../../shared/widgets/app_primary_button.dart';
import 'task_form_selectors.dart';
import 'task_form_helpers.dart';

class TaskFormWidget extends StatefulWidget {
  final Task? initialTask;
  final bool isLoading;
  final Future<void> Function({
    required String titulo,
    String? descricao,
    required TaskStatus status,
    required TaskPriority prioridade,
    int? atribuidoPara,
    DateTime? dataLimite,
  }) onSubmit;

  const TaskFormWidget({
    super.key,
    required this.onSubmit,
    this.initialTask,
    this.isLoading = false,
  });

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _tituloController;
  late final TextEditingController _descricaoController;

  late TaskStatus _status;
  late TaskPriority _prioridade;
  UserSummary? _atribuidoPara;
  DateTime? _dataLimite;
  TimeOfDay? _horarioLimite;
  bool _assigneeInitialized = false;
  late bool _assigneeReady;

  @override
  void initState() {
    super.initState();
    final task = widget.initialTask;
    _tituloController = TextEditingController(text: task?.titulo ?? '');
    _descricaoController = TextEditingController(text: task?.descricao ?? '');
    _status = task?.status ?? TaskStatus.backlog;
    _prioridade = task?.prioridade ?? TaskPriority.media;
    if (task?.dataLimite != null) {
      final dt = task!.dataLimite!.toLocal();
      _dataLimite = DateTime(dt.year, dt.month, dt.day);
      _horarioLimite = TimeOfDay(hour: dt.hour, minute: dt.minute);
    }
    // Se há um responsável inicial, mantém loading até ele ser resolvido
    _assigneeReady = task?.atribuidoParaId == null;
  }

  void _tryInitAssignee(List<UserSummary> users) {
    if (_assigneeInitialized) return;
    _assigneeInitialized = true;
    final id = widget.initialTask?.atribuidoParaId;
    if (id == null) return;
    final match = users.where((u) => u.id == id).firstOrNull;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _atribuidoPara = match;
          _assigneeReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    DateTime? dataLimiteFinal;
    if (_dataLimite != null) {
      final h = _horarioLimite?.hour ?? 0;
      final m = _horarioLimite?.minute ?? 0;
      dataLimiteFinal = DateTime(
        _dataLimite!.year,
        _dataLimite!.month,
        _dataLimite!.day,
        h,
        m,
      );
    }
    await widget.onSubmit(
      titulo: _tituloController.text.trim(),
      descricao: _descricaoController.text.trim().isEmpty
          ? null
          : _descricaoController.text.trim(),
      status: _status,
      prioridade: _prioridade,
      atribuidoPara: _atribuidoPara?.id,
      dataLimite: dataLimiteFinal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UsersCubit>()..loadUsers(),
      child: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            children: [
              // ── Seção: Conteúdo ─────────────────────────────────
              TaskFormSectionHeader(
                icon: Icons.edit_note_rounded,
                label: 'CONTEÚDO',
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _tituloController,
                label: 'Título',
                hint: 'Ex: Implementar tela de login...',
                textInputAction: TextInputAction.next,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Título é obrigatório'
                    : null,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _descricaoController,
                label: 'Descrição',
                hint: 'Descreva os detalhes da tarefa...',
                maxLines: 5,
                textInputAction: TextInputAction.newline,
              ),

              const SizedBox(height: 28),
              Divider(
                color: Theme.of(context).colorScheme.outlineVariant,
                height: 1,
              ),
              const SizedBox(height: 24),

              // ── Seção: Detalhes ──────────────────────────────────
              TaskFormSectionHeader(
                icon: Icons.tune_rounded,
                label: 'DETALHES',
              ),
              const SizedBox(height: 16),

              // Status
              TaskFormFieldLabel(
                icon: Icons.radio_button_checked_outlined,
                label: 'Status',
              ),
              const SizedBox(height: 8),
              TaskStatusSelector(
                value: _status,
                onChanged: (s) => setState(() => _status = s),
              ),
              const SizedBox(height: 16),

              // Prioridade
              TaskFormFieldLabel(
                icon: Icons.flag_outlined,
                label: 'Prioridade',
              ),
              const SizedBox(height: 8),
              TaskPrioritySelector(
                value: _prioridade,
                onChanged: (p) => setState(() => _prioridade = p),
              ),
              const SizedBox(height: 16),

              // Atribuído para
              BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  final users = state.whenOrNull(loaded: (u) => u);
                  if (users != null) _tryInitAssignee(users);
                  final isLoading =
                      state is UsersInitial || state is UsersLoading || !_assigneeReady;
                  return AppSelectField<UserSummary?>(
                    label: 'Atribuído para',
                    value: _atribuidoPara,
                    loading: isLoading,
                    options: [
                      const AppSelectOption(value: null, label: 'Ninguém'),
                      ...?users?.map(
                        (u) => AppSelectOption(value: u, label: u.displayName),
                      ),
                    ],
                    onChanged: (v) => setState(() => _atribuidoPara = v),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Data e hora limite
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: AppDatePickerField(
                      label: 'Data limite',
                      value: _dataLimite,
                      onChanged: (date) => setState(() {
                        _dataLimite = date;
                        if (date == null) _horarioLimite = null;
                      }),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: AppTimePickerField(
                      label: 'Horário',
                      value: _dataLimite != null ? _horarioLimite : null,
                      onChanged: (t) {
                        if (_dataLimite != null) {
                          setState(() => _horarioLimite = t);
                        }
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              AppPrimaryButton(
                label: widget.initialTask != null ? 'Salvar' : 'Criar Tarefa',
                isLoading: widget.isLoading,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


