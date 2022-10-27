part of 'tasks_bloc.dart';

class TasksEvent extends Equatable {
  final List<Task> allTasks;
  const TasksEvent({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [Task];
}

class UpdateTask extends TasksEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [Task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [Task];
}
