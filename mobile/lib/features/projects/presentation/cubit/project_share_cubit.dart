import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/core/errors/app_error_parser.dart';
import '../../domain/entities/project_member.dart';
import '../../domain/usecases/share_use_cases.dart';
import 'project_share_state.dart';

class ProjectShareCubit extends Cubit<ProjectShareState> {
  final GetInviteCode _getInviteCode;
  final RefreshInviteCode _refreshInviteCode;
  final GetMembers _getMembers;
  final AcceptMember _acceptMember;
  final RejectMember _rejectMember;
  final RemoveMember _removeMember;

  String? _projectId;

  ProjectShareCubit({
    required GetInviteCode getInviteCode,
    required RefreshInviteCode refreshInviteCode,
    required GetMembers getMembers,
    required AcceptMember acceptMember,
    required RejectMember rejectMember,
    required RemoveMember removeMember,
  })  : _getInviteCode = getInviteCode,
        _refreshInviteCode = refreshInviteCode,
        _getMembers = getMembers,
        _acceptMember = acceptMember,
        _rejectMember = rejectMember,
        _removeMember = removeMember,
        super(const ProjectShareState.initial());

  Future<void> load(String projectId) async {
    _projectId = projectId;
    emit(const ProjectShareState.loading());
    try {
      final code = await _getInviteCode(projectId);
      final members = await _getMembers(projectId);
      emit(ProjectShareState.loaded(inviteCode: code, members: members));
    } catch (e) {
      emit(ProjectShareState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> refreshCode() async {
    final current =
        state is ProjectShareLoaded ? state as ProjectShareLoaded : null;
    if (current == null || _projectId == null) return;
    try {
      final newCode = await _refreshInviteCode(_projectId!);
      // Como pendentes viram rejected, recarrega membros junto.
      final members = await _getMembers(_projectId!);
      emit(ProjectShareState.loaded(inviteCode: newCode, members: members));
    } catch (e) {
      emit(ProjectShareState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> accept(int userId) => _patchMember(userId, (members, updated) {
        return members.map((m) => m.usuarioId == userId ? updated : m).toList();
      }, action: () => _acceptMember(_projectId!, userId));

  Future<void> reject(int userId) async {
    final current =
        state is ProjectShareLoaded ? state as ProjectShareLoaded : null;
    if (current == null || _projectId == null) return;
    try {
      await _rejectMember(_projectId!, userId);
      emit(current.copyWith(
        members: current.members
            .map((m) => m.usuarioId == userId
                ? ProjectMember(
                    id: m.id,
                    usuarioId: m.usuarioId,
                    username: m.username,
                    email: m.email,
                    status: MemberStatus.rejected,
                    criadoEm: m.criadoEm,
                  )
                : m)
            .toList(),
      ));
    } catch (e) {
      emit(ProjectShareState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> remove(int userId) async {
    final current =
        state is ProjectShareLoaded ? state as ProjectShareLoaded : null;
    if (current == null || _projectId == null) return;
    try {
      await _removeMember(_projectId!, userId);
      emit(current.copyWith(
        members: current.members.where((m) => m.usuarioId != userId).toList(),
      ));
    } catch (e) {
      emit(ProjectShareState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  /// Helper para ações que substituem um membro pelo retorno da API.
  Future<void> _patchMember(
    int userId,
    List<ProjectMember> Function(List<ProjectMember>, ProjectMember) reducer, {
    required Future<ProjectMember> Function() action,
  }) async {
    final current =
        state is ProjectShareLoaded ? state as ProjectShareLoaded : null;
    if (current == null || _projectId == null) return;
    try {
      final updated = await action();
      emit(current.copyWith(members: reducer(current.members, updated)));
    } catch (e) {
      emit(ProjectShareState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }
}
