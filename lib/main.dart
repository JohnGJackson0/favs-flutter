import 'package:favs_app/models/task.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc_exports.dart';
import 'screens/tasks_screen.dart';

void main() {
  // ignore: deprecated_member_use 
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(AddTask(
            task: Task(title: 'task1', isDone: false, isDeleted: false))),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
