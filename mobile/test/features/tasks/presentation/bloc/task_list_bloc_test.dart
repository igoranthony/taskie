import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taskie/features/tasks/domain/entities/task.dart';
import 'package:taskie/features/tasks/domain/usecases/get_tasks.dart';
import 'package:taskie/features/tasks/domain/usecases/delete_task.dart';
import 'package:taskie/features/tasks/presentation/bloc/task_list/task_list_bloc.dart';
import 'package:taskie/features/tasks/presentation/bloc/task_list/task_list_event.dart';
import 'package:taskie/features/tasks/presentation/bloc/task_list/task_list_state.dart';

import 'task_list_bloc_test.mocks.dart';

@GenerateMocks([GetTasks, DeleteTask])
void main() {
  late MockGetTasks mockGetTasks;
  late MockDeleteTask mockDeleteTask;

  final tTask = Task(
    id: '1',
    titulo: 'Tarefa teste',
    status: TaskStatus.backlog,
    prioridade: TaskPriority.media,
    criadoPor: 'user',
    criadoEm: DateTime(2025),
    atualizadoEm: DateTime(2025),
  );

  setUp(() {
    mockGetTasks = MockGetTasks();
    mockDeleteTask = MockDeleteTask();
  });

  TaskListBloc buildBloc() => TaskListBloc(
        getTasks: mockGetTasks,
        deleteTask: mockDeleteTask,
      );

  group('TaskListBloc', () {
    test('estado inicial é TaskListInitial', () {
      expect(buildBloc().state, const TaskListState.initial());
    });

    blocTest<TaskListBloc, TaskListState>(
      'loaded emite [loading, success] quando use case retorna tarefas',
      build: buildBloc,
      setUp: () {
        when(mockGetTasks()).thenAnswer(
          (_) async => (tasks: [tTask], hasNext: false),
        );
      },
      act: (bloc) => bloc.add(const TaskListEvent.loaded()),
      expect: () => [
        const TaskListState.loading(),
        TaskListState.success(tasks: [tTask], hasReachedMax: true),
      ],
    );

    blocTest<TaskListBloc, TaskListState>(
      'loaded emite [loading, failure] quando use case lança exceção',
      build: buildBloc,
      setUp: () {
        when(mockGetTasks()).thenThrow(Exception('erro de rede'));
      },
      act: (bloc) => bloc.add(const TaskListEvent.loaded()),
      expect: () => [
        const TaskListState.loading(),
        isA<TaskListFailure>(),
      ],
    );

    blocTest<TaskListBloc, TaskListState>(
      'loadedMore não emite nada quando hasReachedMax é true',
      build: buildBloc,
      seed: () => TaskListState.success(tasks: [tTask], hasReachedMax: true),
      act: (bloc) => bloc.add(const TaskListEvent.loadedMore()),
      expect: () => [],
    );

    blocTest<TaskListBloc, TaskListState>(
      'loadedMore acrescenta tarefas e incrementa página',
      build: buildBloc,
      seed: () => TaskListState.success(
        tasks: [tTask],
        hasReachedMax: false,
        page: 1,
      ),
      setUp: () {
        final tTask2 = tTask.copyWith(id: '2', titulo: 'Tarefa 2');
        when(mockGetTasks(page: 2)).thenAnswer(
          (_) async => (tasks: [tTask2], hasNext: false),
        );
      },
      act: (bloc) => bloc.add(const TaskListEvent.loadedMore()),
      expect: () => [
        isA<TaskListSuccess>().having((s) => s.isLoadingMore, 'isLoadingMore', true),
        isA<TaskListSuccess>()
            .having((s) => s.tasks.length, 'tasks.length', 2)
            .having((s) => s.page, 'page', 2)
            .having((s) => s.hasReachedMax, 'hasReachedMax', true),
      ],
    );

    blocTest<TaskListBloc, TaskListState>(
      'filtered aplica filtros e emite [loading, success]',
      build: buildBloc,
      setUp: () {
        when(mockGetTasks(status: TaskStatus.backlog)).thenAnswer(
          (_) async => (tasks: [tTask], hasNext: false),
        );
      },
      act: (bloc) => bloc.add(
        const TaskListEvent.filtered(status: TaskStatus.backlog),
      ),
      expect: () => [
        const TaskListState.loading(),
        isA<TaskListSuccess>()
            .having((s) => s.filterStatus, 'filterStatus', TaskStatus.backlog),
      ],
    );
  });
}
