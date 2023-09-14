import 'package:equatable/equatable.dart';
import '../../models/task_model.dart';

abstract class TaskState extends Equatable{
  @override
  List<Object?> get props => [];
}

class TaskLoading extends TaskState{}

class TaskError extends TaskState{
  final String error;
  TaskError(this.error);
  @override
  List<Object?> get props => [error];
}

class TaskInitial extends TaskState{}

class TaskLoaded extends TaskState{
  final List<TaskModel> task;
  final List<TaskModel> taskCompleted, taskIncompleted;
  TaskLoaded(this.task, this.taskCompleted, this.taskIncompleted);
  @override
  List<Object?> get props => [task, taskCompleted, taskIncompleted];
}