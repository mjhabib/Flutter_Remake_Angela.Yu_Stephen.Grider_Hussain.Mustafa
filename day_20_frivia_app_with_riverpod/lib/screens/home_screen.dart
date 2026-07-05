import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  double? deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: deviceHeight! * 0.05),
          child: gameUI(),
        ),
      ),
    );
  }

  Widget gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        questionText(),
        Center(
          child: Column(
            children: [
              trueFalseButton('True', Colors.greenAccent, () {}),
              SizedBox(height: deviceHeight! * 0.01),
              trueFalseButton('False', Colors.redAccent, () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget questionText() {
    return Text(
      'Some questions',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  Widget trueFalseButton(
    String label,
    Color selectedColor,
    VoidCallback? onPressed,
  ) {
    return MaterialButton(
      onPressed: onPressed,
      color: selectedColor,
      minWidth: deviceWidth! * 0.80,
      height: deviceHeight! * 0.10,
      child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
