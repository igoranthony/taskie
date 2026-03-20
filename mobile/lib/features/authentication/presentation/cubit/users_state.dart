import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_summary.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = UsersInitial;
  const factory UsersState.loading() = UsersLoading;
  const factory UsersState.loaded(List<UserSummary> users) = UsersLoaded;
  const factory UsersState.failure(String message) = UsersFailure;
}
