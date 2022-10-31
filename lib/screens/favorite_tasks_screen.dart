import 'package:favs_app/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/tasks_lists.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.favoriteTasks.length} Tasks',
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
