import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:gestao_tarefas_tradex/features/tasks/domain/entities/task.dart';
import 'package:gestao_tarefas_tradex/features/tasks/domain/usecases/create_task.dart';
import 'package:gestao_tarefas_tradex/features/tasks/domain/usecases/update_task.dart';
import 'package:gestao_tarefas_tradex/features/tasks/presentation/bloc/task_form/task_form_bloc.dart';
import 'package:gestao_tarefas_tradex/features/tasks/presentation/bloc/task_form/task_form_event.dart';
import 'package:gestao_tarefas_tradex/features/tasks/presentation/bloc/task_form/task_form_state.dart';

import 'task_form_bloc_test.mocks.dart';

@GenerateMocks([CreateTask, UpdateTask])
void main() {
  late MockCreateTask mockCreateTask;
  late MockUpdateTask mockUpdateTask;

  final tTask = Task(
    id: '1',
    titulo: 'Nova tarefa',
    status: TaskStatus.backlog,
    prioridade: TaskPriority.media,
    criadoPor: 'user',
    criadoEm: DateTime(2025),
    atualizadoEm: DateTime(2025),
  );

  const tSubmitEvent = TaskFormEvent.submitted(
    titulo: 'Nova tarefa',
    status: TaskStatus.backlog,
    prioridade: TaskPriority.media,
  );

  setUp(() {
    mockCreateTask = MockCreateTask();
    mockUpdateTask = MockUpdateTask();
  });

  TaskFormBloc buildBloc() => TaskFormBloc(
        createTask: mockCreateTask,
        updateTask: mockUpdateTask,
      );

  group('TaskFormBloc', () {
    test('estado inicial é TaskFormInitial', () {
      expect(buildBloc().state, const TaskFormState.initial());
    });

    blocTest<TaskFormBloc, TaskFormState>(
      'submitted sem initialTask chama createTask e emite [loading, success]',
      build: buildBloc,
      setUp: () {
        when(mockCreateTask(any)).thenAnswer((_) async => tTask);
      },
      act: (bloc) => bloc.add(tSubmitEvent),
      expect: () => [
        const TaskFormState.loading(),
        TaskFormState.success(tTask),
      ],
      verify: (_) {
        verify(mockCreateTask(any)).called(1);
        verifyNever(mockUpdateTask(any));
      },
    );

    blocTest<TaskFormBloc, TaskFormState>(
      'submitted com initialTask chama updateTask e emite [loading, success]',
      build: buildBloc,
      setUp: () {
        when(mockUpdateTask(any)).thenAnswer((_) async => tTask);
      },
      act: (bloc) => bloc.add(TaskFormEvent.submitted(
        initialTask: tTask,
        titulo: 'Título editado',
        status: TaskStatus.emAndamento,
        prioridade: TaskPriority.alta,
      )),
      expect: () => [
        const TaskFormState.loading(),
        isA<TaskFormSuccess>(),
      ],
      verify: (_) {
        verify(mockUpdateTask(any)).called(1);
        verifyNever(mockCreateTask(any));
      },
    );

    blocTest<TaskFormBloc, TaskFormState>(
      'submitted emite [loading, failure] quando use case lança exceção',
      build: buildBloc,
      setUp: () {
        when(mockCreateTask(any)).thenThrow(Exception('erro'));
      },
      act: (bloc) => bloc.add(tSubmitEvent),
      expect: () => [
        const TaskFormState.loading(),
        isA<TaskFormFailure>(),
      ],
    );
  });
}
