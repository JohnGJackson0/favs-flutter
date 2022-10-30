import 'package:favs_app/screens/my_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/tasks_lists.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recycle Bin'),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: Chip(
                label: Text('Tasks'),
              ),
            ),
            TaskList(tasksList: []),
          ],
        ));
  }
}
