import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/update_task.dart';
import '../bloc/task_form/task_form_bloc.dart';
import '../bloc/task_form/task_form_event.dart';
import '../bloc/task_form/task_form_state.dart';
import '../widgets/task_form_widget.dart';
import '../../../../shared/widgets/app_page.dart';
import '../../../../shared/widgets/app_snackbar.dart';

class TaskFormPage extends StatelessWidget {
  final Task? initialTask;

  const TaskFormPage({super.key, this.initialTask});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskFormBloc(
        createTask: getIt<CreateTask>(),
        updateTask: getIt<UpdateTask>(),
      ),
      child: _TaskFormView(initialTask: initialTask),
    );
  }
}

class _TaskFormView extends StatelessWidget {
  final Task? initialTask;

  const _TaskFormView({this.initialTask});

  @override
  Widget build(BuildContext context) {
    final isEditing = initialTask != null;

    return BlocListener<TaskFormBloc, TaskFormState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (task) {
            AppSnackbar.success(
              context,
              isEditing
                  ? 'Tarefa atualizada com sucesso!'
                  : 'Tarefa criada com sucesso!',
            );
            context.pop(task);
          },
          failure: (message) => AppSnackbar.error(context, 'Erro: $message'),
        );
      },
      child: BlocBuilder<TaskFormBloc, TaskFormState>(
        builder: (context, state) {
          return AppPage(
            title: isEditing ? 'Editar Tarefa' : 'Nova Tarefa',
            body: TaskFormWidget(
              initialTask: initialTask,
              isLoading: state is TaskFormLoading,
              onSubmit: ({
                required String titulo,
                String? descricao,
                required TaskStatus status,
                required TaskPriority prioridade,
                int? atribuidoPara,
                DateTime? dataLimite,
              }) async {
                context.read<TaskFormBloc>().add(
                      TaskFormEvent.submitted(
                        initialTask: initialTask,
                        titulo: titulo,
                        descricao: descricao,
                        status: status,
                        prioridade: prioridade,
                        atribuidoPara: atribuidoPara,
                        dataLimite: dataLimite,
                      ),
                    );
              },
            ),
          );
        },
      ),
    );
  }
}
