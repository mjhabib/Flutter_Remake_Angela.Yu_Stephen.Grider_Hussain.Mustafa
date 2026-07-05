import 'package:flutter/material.dart';

import 'package:frivia_app/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1),
      ),
      title: 'Frivia App',
      home: HomeScreen(),
    );
  }
}
