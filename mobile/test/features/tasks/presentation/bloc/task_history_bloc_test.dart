import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:gestao_tarefas_tradex/features/tasks/domain/entities/task_history.dart';
import 'package:gestao_tarefas_tradex/features/tasks/domain/usecases/get_task_history.dart';
import 'package:gestao_tarefas_tradex/features/tasks/presentation/bloc/task_history/task_history_bloc.dart';
import 'package:gestao_tarefas_tradex/features/tasks/presentation/bloc/task_history/task_history_event.dart';
import 'package:gestao_tarefas_tradex/features/tasks/presentation/bloc/task_history/task_history_state.dart';

import 'task_history_bloc_test.mocks.dart';

@GenerateMocks([GetTaskHistory])
void main() {
  late MockGetTaskHistory mockGetTaskHistory;

  final tHistory = [
    TaskHistory(
      id: '1',
      taskId: '42',
      fieldName: 'status',
      oldValue: 'backlog',
      newValue: 'em_andamento',
      changedBy: 'user',
      changedAt: DateTime(2025),
    ),
  ];

  setUp(() {
    mockGetTaskHistory = MockGetTaskHistory();
  });

  TaskHistoryBloc buildBloc() =>
      TaskHistoryBloc(getTaskHistory: mockGetTaskHistory);

  group('TaskHistoryBloc', () {
    test('estado inicial é TaskHistoryInitial', () {
      expect(buildBloc().state, const TaskHistoryState.initial());
    });

    blocTest<TaskHistoryBloc, TaskHistoryState>(
      'loaded emite [loading, success] com lista de histórico',
      build: buildBloc,
      setUp: () {
        when(mockGetTaskHistory('42')).thenAnswer((_) async => tHistory);
      },
      act: (bloc) => bloc.add(const TaskHistoryEvent.loaded('42')),
      expect: () => [
        const TaskHistoryState.loading(),
        TaskHistoryState.success(tHistory),
      ],
    );

    blocTest<TaskHistoryBloc, TaskHistoryState>(
      'loaded emite [loading, success] com lista vazia quando não há histórico',
      build: buildBloc,
      setUp: () {
        when(mockGetTaskHistory('42')).thenAnswer((_) async => []);
      },
      act: (bloc) => bloc.add(const TaskHistoryEvent.loaded('42')),
      expect: () => [
        const TaskHistoryState.loading(),
        const TaskHistoryState.success([]),
      ],
    );

    blocTest<TaskHistoryBloc, TaskHistoryState>(
      'loaded emite [loading, failure] quando use case lança exceção',
      build: buildBloc,
      setUp: () {
        when(mockGetTaskHistory(any)).thenThrow(Exception('erro'));
      },
      act: (bloc) => bloc.add(const TaskHistoryEvent.loaded('99')),
      expect: () => [
        const TaskHistoryState.loading(),
        isA<TaskHistoryFailure>(),
      ],
    );
  });
}
