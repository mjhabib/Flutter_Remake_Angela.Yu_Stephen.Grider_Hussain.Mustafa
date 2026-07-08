import 'package:flutter/material.dart';

import 'package:finstagram_app/screens/login_screen.dart';
import 'package:finstagram_app/screens/register_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finstagram',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
      },
    );
  }
}
