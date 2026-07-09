import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:finstagram_app/screens/home_screen.dart';
import 'package:finstagram_app/screens/login_screen.dart';
import 'package:finstagram_app/screens/register_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, useMaterial3: false),
      title: 'Finstagram',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
