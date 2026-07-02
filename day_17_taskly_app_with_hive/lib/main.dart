import 'package:flutter/material.dart';

import 'package:taskly_app/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      title: 'Taskly',
      home: Scaffold(body: HomeScreen()),
    );
  }
}
