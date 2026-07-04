import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  double buttonRadios = 100;
  // tween = in between
  final Tween<double> backgroundScale = Tween<double>(begin: 0, end: 1);
  // animation controller
  AnimationController? starIconAnimationController;

  @override
  void initState() {
    super.initState();
    starIconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    // starIconAnimationController!.forward(); // start
    starIconAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animdo App',
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            screenBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [circularButton(), starIcon()],
            ),
          ],
        ),
      ),
    );
  }

  Widget screenBackground() {
    return TweenAnimationBuilder(
      tween: backgroundScale,
      duration: Duration(seconds: 30),
      builder: (BuildContext context, double? value, Widget? child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(color: Colors.blueAccent),
    );
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
          duration: Duration(seconds: 30),
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

  Widget starIcon() {
    return AnimatedBuilder(
      animation: starIconAnimationController!.view,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          // to convert degrees to radios we can multiply our value to 2 * pi
          angle: starIconAnimationController!.value * 2 * pi,
          child: child,
        );
      },
      child: Icon(Icons.star, size: 100, color: Colors.white),
    );
  }
}
