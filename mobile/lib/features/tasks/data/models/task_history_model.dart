import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_history.dart';

part 'task_history_model.freezed.dart';
part 'task_history_model.g.dart';

// TaskHistory uses auto-increment int id (does not inherit BaseModel)
String _idFromJson(dynamic v) => v.toString();
String? _nullableToString(dynamic v) => v?.toString();

@freezed
abstract class TaskHistoryModel with _$TaskHistoryModel {
  const TaskHistoryModel._();

  const factory TaskHistoryModel({
    @JsonKey(fromJson: _idFromJson) required String id,
    @JsonKey(name: 'task_id', fromJson: _nullableToString) String? taskId,
    @JsonKey(name: 'field_name') required String fieldName,
    @JsonKey(name: 'old_value') String? oldValue,
    @JsonKey(name: 'new_value') String? newValue,
    // API returns FK int for changed_by; changed_by_username is the display value
    @JsonKey(name: 'changed_by_username') required String changedBy,
    @JsonKey(name: 'changed_at') required String changedAt,
  }) = _TaskHistoryModel;

  factory TaskHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TaskHistoryModelFromJson(json);

  TaskHistory toEntity() => TaskHistory(
        id: id,
        taskId: taskId,
        fieldName: fieldName,
        oldValue: oldValue,
        newValue: newValue,
        changedBy: changedBy,
        changedAt: DateTime.parse(changedAt),
      );
}
