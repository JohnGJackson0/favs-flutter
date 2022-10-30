import 'package:favs_app/screens/recycle_bin.dart';
import 'package:favs_app/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

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
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
              child: const ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text('My Tasks'),
                  trailing: Text('0')),
            ),
            const Divider(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
              child: const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Bin'),
                  trailing: Text('0')),
            )
          ],
        ),
      ),
    );
  }
}
