import 'package:favs_app/screens/recycle_bin.dart';
import 'package:favs_app/screens/tabs_screen.dart';
import 'package:favs_app/screens/pending_tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) =>  TabsScreen());
      default:
        return null;
    }
  }
}
