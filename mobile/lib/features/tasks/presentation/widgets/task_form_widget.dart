import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/task.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../features/authentication/domain/entities/user_summary.dart';
import '../../../../features/authentication/presentation/cubit/users_cubit.dart';
import '../../../../features/authentication/presentation/cubit/users_state.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_select_field.dart';
import '../../../../shared/widgets/app_date_picker_field.dart';
import '../../../../shared/widgets/app_primary_button.dart';
import '../../../../shared/widgets/app_form_body.dart';

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

  @override
  void initState() {
    super.initState();
    final task = widget.initialTask;
    _tituloController = TextEditingController(text: task?.titulo ?? '');
    _descricaoController = TextEditingController(text: task?.descricao ?? '');
    _status = task?.status ?? TaskStatus.backlog;
    _prioridade = task?.prioridade ?? TaskPriority.media;
    _dataLimite = task?.dataLimite;
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    await widget.onSubmit(
      titulo: _tituloController.text.trim(),
      descricao: _descricaoController.text.trim().isEmpty
          ? null
          : _descricaoController.text.trim(),
      status: _status,
      prioridade: _prioridade,
      atribuidoPara: _atribuidoPara?.id,
      dataLimite: _dataLimite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UsersCubit>()..loadUsers(),
      child: Builder(
        builder: (context) {
          return AppFormBody(
            formKey: _formKey,
            children: [
              AppTextField(
                controller: _tituloController,
                label: 'Título *',
                semanticLabel: 'Campo título da tarefa',
                textInputAction: TextInputAction.next,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Título é obrigatório' : null,
              ),
              AppTextField(
                controller: _descricaoController,
                label: 'Descrição',
                maxLines: 3,
                textInputAction: TextInputAction.next,
              ),
              AppSelectField<TaskStatus>(
                label: 'Status',
                value: _status,
                options: const [
                  AppSelectOption(value: TaskStatus.backlog, label: 'Backlog'),
                  AppSelectOption(
                      value: TaskStatus.emAndamento, label: 'Em Andamento'),
                  AppSelectOption(
                      value: TaskStatus.concluido, label: 'Concluído'),
                ],
                onChanged: (v) => setState(() => _status = v!),
              ),
              AppSelectField<TaskPriority>(
                label: 'Prioridade',
                value: _prioridade,
                options: const [
                  AppSelectOption(value: TaskPriority.baixa, label: 'Baixa'),
                  AppSelectOption(value: TaskPriority.media, label: 'Média'),
                  AppSelectOption(value: TaskPriority.alta, label: 'Alta'),
                ],
                onChanged: (v) => setState(() => _prioridade = v!),
              ),
              BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const SizedBox(
                      height: 56,
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                    loaded: (users) => AppSelectField<UserSummary?>(
                      label: 'Atribuído para',
                      value: _atribuidoPara,
                      options: [
                        const AppSelectOption(value: null, label: 'Ninguém'),
                        ...users.map(
                          (u) => AppSelectOption(value: u, label: u.displayName),
                        ),
                      ],
                      onChanged: (v) => setState(() => _atribuidoPara = v),
                    ),
                    failure: (_) => const SizedBox.shrink(),
                  );
                },
              ),
              AppDatePickerField(
                label: 'Data limite',
                value: _dataLimite,
                onChanged: (date) => setState(() => _dataLimite = date),
              ),
              const SizedBox(height: 8),
              AppPrimaryButton(
                label: widget.initialTask != null ? 'Salvar' : 'Criar Tarefa',
                isLoading: widget.isLoading,
                semanticLabel: widget.initialTask != null
                    ? 'Salvar alterações da tarefa'
                    : 'Criar nova tarefa',
                onPressed: _submit,
              ),
            ],
          );
        },
      ),
    );
  }
}
