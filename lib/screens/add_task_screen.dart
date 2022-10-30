import 'package:favs_app/blocs/bloc_exports.dart';
import 'package:favs_app/services/guid_gen.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('Add Task', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        title: titleController.text,
                            id: GUIDGen.generate(),
                        isDone: false,
                        isDeleted: false);

                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                      child: const Text('Add'))),
              Expanded(
                  child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('cancel'))),
            ],
          ),
        ],
      ),
    );
  }
}
