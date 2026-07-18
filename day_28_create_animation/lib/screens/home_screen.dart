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
      duration: Duration(seconds: 30),
    );

    catAnimation = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));

    catController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return buildAnimation();
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        // the container is an inexpensive widget to recreate/build 60 times/s (animate) but the CatImage can be expensive to build, that's why we move/animate the container not the cat
        return Container(
          margin: EdgeInsets.only(top: catAnimation.value),
          child: child,
        );
      },
      child: CatImage(),
    );
  }
}
