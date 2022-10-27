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
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
