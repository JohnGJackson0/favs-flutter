import 'package:favs_app/screens/recycle_bin.dart';
import 'package:favs_app/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => TasksScreen());
      default:
        return null;
    }
  }
}
