import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;

  const PopupMenu(
      {Key? key, required this.task, required this.cancelOrDeleteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark),
                        label: const Text('Add To Bookmarks')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete')),
                    onTap: cancelOrDeleteCallback,
                  )
                ]
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text('Restore')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Forever')),
                    onTap: cancelOrDeleteCallback,
                  )
                ]);
  }
}
