part of 'task_cubit.dart';

@immutable
class TaskState {
  final List<Task> holder = [];
}

class TaskInitial extends TaskState {
  final List<Task> holder;
  TaskInitial({required this.holder});
}

class TaskAdded extends TaskState {
  final List<Task> holder;
  TaskAdded({required this.holder});
}

class TaskDeleted extends TaskState {
  final List<Task> holder;
  TaskDeleted({required this.holder});
}
