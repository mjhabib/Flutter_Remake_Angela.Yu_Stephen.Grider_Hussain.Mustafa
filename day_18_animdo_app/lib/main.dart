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
  double buttonRadios = 100;
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
        onTap: () {
          setState(() {
            buttonRadios += buttonRadios == 100 ? 100 : -100;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 5),
          curve: Curves.bounceInOut,
          height: buttonRadios,
          width: buttonRadios,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(buttonRadios),
          ),
          child: Center(child: Text('Basic')),
        ),
      ),
    );
  }
}
