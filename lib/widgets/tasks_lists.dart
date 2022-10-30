import 'package:favs_app/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

// widgets can be seperated from scaffold
class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasksList[index].title),
            trailing: Checkbox(
              value: tasksList[index].isDone,
              onChanged: (value) {
                context
                    .read<TasksBloc>()
                    .add(UpdateTask(task: tasksList[index]));
              },
            ),
            onLongPress: () => {
              context.read<TasksBloc>().add(DeleteTask(task: tasksList[index]))
            },
          );
        },
      ),
    );
  }
}
