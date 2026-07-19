import 'package:create_animation/widgets/cat_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    catAnimation = Tween(
      begin: -30.0,
      end: -150.0,
    ).animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  void onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          buildCatAnimation(),
          buildBox(),
          buildLeftFlap(),
          buildRightFlap(),
        ],
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        // the Positioned widget is an inexpensive widget to recreate/build/animate 60 times/s but the CatImage can be expensive to build/animate, that's why we animate the Positioned not the cat
        return Positioned(
          top: catAnimation.value,
          right: 0,
          left: 0,
          child: child!,
        );
      },
      child: CatImage(),
    );
  }

  Widget buildBox() {
    return Container(width: 300, height: 250, color: Colors.blueGrey);
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 3,
      child: Transform.rotate(
        angle: 3.14 * 0.6,
        alignment: Alignment.topLeft,
        child: Container(width: 150, height: 12, color: Colors.blueGrey),
      ),
    );
  }

  Widget buildRightFlap() {
    // RotateBox is an alternative class to Transform with some differences
    return Positioned(
      left: 147,
      child: Transform.rotate(
        angle: -3.14 * 0.6,
        alignment: Alignment.topRight,
        child: Container(width: 150, height: 12, color: Colors.blueGrey),
      ),
    );
  }
}

/* 
To covert radians to degrees for our angel:
pi / 2 = 90
pi = 180
3 * (pi / 2) = 360
 */
