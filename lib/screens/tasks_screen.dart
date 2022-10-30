import 'package:favs_app/blocs/bloc_exports.dart';
import 'package:favs_app/screens/my_drawer.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/tasks_lists.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();

  static const id = 'tasks_screen';

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(titleController: titleController))));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      '${state.allTasks.length} Tasks',
                    ),
                  ),
                ),
                TaskList(tasksList: tasksList),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
              child: const Icon(Icons.add)
          ),
        );
      },
    );
  }
}
