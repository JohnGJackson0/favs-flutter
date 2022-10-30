import 'package:favs_app/screens/recycle_bin.dart';
import 'package:favs_app/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
                color: Colors.grey,
                child: const Text('Task Drawer'),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TasksScreen.id),
                  child: ListTile(
                      leading: const Icon(Icons.folder_special),
                      title: const Text('My Tasks'),
                      trailing: Text('${state.allTasks.length}')),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Bin'),
                      trailing: Text('${state.removedTasks.length}')),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
