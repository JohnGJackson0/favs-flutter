import 'package:favs_app/screens/recycle_bin.dart';
import 'package:favs_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/theme_bloc/theme_event.dart';
import '../blocs/theme_bloc/theme_state.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
                child: const Text('Task Drawer'),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                      leading: const Icon(Icons.folder_special),
                      title: const Text('My Tasks'),
                      trailing: Text('${state.pendingTasks.length}')),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}')),
              );
            }),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                    value: state.isDarkTheme,
                    onChanged: (value) {
                      context
                          .read<ThemeBloc>()
                          .add(UpdateAppTheme(newThemeIsDark: value));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
