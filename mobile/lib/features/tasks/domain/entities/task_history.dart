import 'package:equatable/equatable.dart';

class TaskHistory extends Equatable {
  final String id;
  final String? taskId;
  final String fieldName;
  final String? oldValue;
  final String? newValue;
  final String changedBy;
  final DateTime changedAt;

  const TaskHistory({
    required this.id,
    this.taskId,
    required this.fieldName,
    this.oldValue,
    this.newValue,
    required this.changedBy,
    required this.changedAt,
  });

  @override
  List<Object?> get props => [
        id,
        taskId,
        fieldName,
        oldValue,
        newValue,
        changedBy,
        changedAt,
      ];
}