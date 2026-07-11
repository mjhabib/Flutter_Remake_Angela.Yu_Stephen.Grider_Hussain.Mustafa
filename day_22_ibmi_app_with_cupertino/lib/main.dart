import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
      ),
      title: 'IBMI App',
      initialRoute: '/',
      routes: {'/': (p0) => MainScreen()},
    );
  }
}
