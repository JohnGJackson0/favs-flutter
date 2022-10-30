import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:favs_app/blocs/bloc_exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _updateDoneOrDoNoting(BuildContext ctx, Task task) {
    task.isDeleted! ? null : ctx.read<TasksBloc>().add(UpdateTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(task.title,
            style: TextStyle(
                decoration: task.isDone! ? TextDecoration.lineThrough : null)),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            _updateDoneOrDoNoting(context, task);
          },
        ),
        onLongPress: () => _removeOrDeleteTask(context, task));
  }
}
