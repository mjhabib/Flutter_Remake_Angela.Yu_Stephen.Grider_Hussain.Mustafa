import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:create_animation/screens/home_screen.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animation',
      home: Scaffold(body: Center(child: HomeScreen())),
    );
  }
}
