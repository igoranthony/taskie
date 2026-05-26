import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taskie/features/tasks/domain/entities/task.dart';
import 'package:taskie/features/tasks/domain/repositories/task_repository.dart';
import 'package:taskie/features/tasks/presentation/bloc/task_detail/task_detail_bloc.dart';
import 'package:taskie/features/tasks/presentation/bloc/task_detail/task_detail_event.dart';
import 'package:taskie/features/tasks/presentation/bloc/task_detail/task_detail_state.dart';

import 'task_detail_bloc_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockRepository;

  final tTask = Task(
    id: '42',
    titulo: 'Tarefa detalhe',
    status: TaskStatus.emAndamento,
    prioridade: TaskPriority.alta,
    criadoPor: 'user',
    criadoEm: DateTime(2025),
    atualizadoEm: DateTime(2025),
  );

  setUp(() {
    mockRepository = MockTaskRepository();
  });

  TaskDetailBloc buildBloc() =>
      TaskDetailBloc(taskRepository: mockRepository);

  group('TaskDetailBloc', () {
    test('estado inicial é TaskDetailInitial', () {
      expect(buildBloc().state, const TaskDetailState.initial());
    });

    blocTest<TaskDetailBloc, TaskDetailState>(
      'loaded emite [loading, success] quando repositório retorna a task',
      build: buildBloc,
      setUp: () {
        when(mockRepository.getTaskById('42'))
            .thenAnswer((_) async => tTask);
      },
      act: (bloc) => bloc.add(const TaskDetailEvent.loaded('42')),
      expect: () => [
        const TaskDetailState.loading(),
        TaskDetailState.success(tTask),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'loaded emite [loading, failure] quando repositório lança exceção',
      build: buildBloc,
      setUp: () {
        when(mockRepository.getTaskById(any))
            .thenThrow(Exception('não encontrado'));
      },
      act: (bloc) => bloc.add(const TaskDetailEvent.loaded('99')),
      expect: () => [
        const TaskDetailState.loading(),
        isA<TaskDetailFailure>(),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'refreshed recarrega a task já carregada',
      build: buildBloc,
      setUp: () {
        when(mockRepository.getTaskById('42'))
            .thenAnswer((_) async => tTask);
      },
      act: (bloc) async {
        bloc.add(const TaskDetailEvent.loaded('42'));
        await Future.delayed(Duration.zero);
        bloc.add(const TaskDetailEvent.refreshed());
      },
      expect: () => [
        const TaskDetailState.loading(),
        TaskDetailState.success(tTask),
        const TaskDetailState.loading(),
        TaskDetailState.success(tTask),
      ],
    );

    blocTest<TaskDetailBloc, TaskDetailState>(
      'refreshed sem task carregada não emite nada',
      build: buildBloc,
      act: (bloc) => bloc.add(const TaskDetailEvent.refreshed()),
      expect: () => [],
    );
  });
}
