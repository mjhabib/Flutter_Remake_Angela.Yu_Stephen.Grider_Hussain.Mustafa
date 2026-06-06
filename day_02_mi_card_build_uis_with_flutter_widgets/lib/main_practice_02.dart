import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(color: Colors.pinkAccent, width: 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: Colors.amber, width: 100, height: 100),
                Container(color: Colors.greenAccent, width: 100, height: 100),
              ],
            ),
            Container(color: Colors.blue, width: 100),
          ],
        ),
      ),
    );
  }
}
