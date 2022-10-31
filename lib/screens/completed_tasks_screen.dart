import 'package:favs_app/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/tasks_lists.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.completedTasks.length} Tasks',
                  ),
                ),
              ),
              TaskList(tasksList: tasksList),
            ],
          ),
        );
      },
    );
  }
}
