import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animdo App',
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [screenBackground(), circularButton()],
        ),
      ),
    );
  }

  Widget screenBackground() {
    return Container(color: Colors.blueAccent);
  }

  Widget circularButton() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
