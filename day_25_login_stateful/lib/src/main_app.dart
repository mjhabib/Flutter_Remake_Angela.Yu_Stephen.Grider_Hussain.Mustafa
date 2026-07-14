import 'package:flutter/material.dart';
import 'package:login_stateful/src/screens/login_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Log Me In!',
      home: Scaffold(body: Center(child: LoginScreen())),
    );
  }
}
