import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:taskly_app/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter('/hive_boxes');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Taskly', home: HomeScreen());
  }
}
