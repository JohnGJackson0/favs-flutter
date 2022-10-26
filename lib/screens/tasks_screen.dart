import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  final List<Task> tasksList = [
    Task(title: 'Task1', isDeleted: false, isDone: false),
    Task(title: 'Task2', isDeleted: false, isDone: false),
    Task(title: 'Task3', isDeleted: false, isDone: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text(
                'Tasks:',
              ),
            ),
          ),
          Expanded(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
