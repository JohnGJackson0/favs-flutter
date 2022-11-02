import 'package:favs_app/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(
            children: [
              const Icon(Icons.star_outline),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                    Text(DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(task.date)))
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: (value) {
                _updateDoneOrDoNoting(context, task);
              },
            ),
            PopupMenu(
                task: task,
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task))
          ],
        ),
      ]),
    );
  }
}


/*

ListTile(
        title: Text(task.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                decoration: task.isDone! ? TextDecoration.lineThrough : null)),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            _updateDoneOrDoNoting(context, task);
          },
        ),
        onLongPress: () => _removeOrDeleteTask(context, task));
*/
