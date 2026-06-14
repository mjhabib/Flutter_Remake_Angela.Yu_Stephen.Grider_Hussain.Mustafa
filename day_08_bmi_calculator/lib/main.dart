import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. I can use a theme to share colors and font styles throughout an app (or for certain widget)
      // it makes sense if I have more than one page/place to use the same theme
      // theme: ThemeData(
      //   primaryColor: Color(0xff0a0e21),
      //   scaffoldBackgroundColor: Color(0xff0a0e21),
      //   colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0a0e21)),
      //   appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0a0e21)),
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      //     bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
      //   ),
      // ),

      // 2. or I can simply use a default theme (like dark) and just override the parts I want to be different
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff0a0e21)),
      ),
      home: InputPage(),
    );
  }
}
