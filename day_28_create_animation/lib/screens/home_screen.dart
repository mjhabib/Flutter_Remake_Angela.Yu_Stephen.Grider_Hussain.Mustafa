import 'package:create_animation/widgets/cat_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return buildAnimation();
  }

  Widget buildAnimation() {
    return CatImage();
  }
}
