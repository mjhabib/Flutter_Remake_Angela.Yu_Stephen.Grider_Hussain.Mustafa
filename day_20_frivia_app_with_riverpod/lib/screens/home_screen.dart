import 'package:flutter/material.dart';

import 'package:frivia_app/widgets/question_text.dart';
import 'package:frivia_app/widgets/true_false_button.dart';

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
          padding: EdgeInsets.symmetric(
            vertical: deviceHeight! * 0.05,
            horizontal: deviceWidth! * 0.05,
          ),
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
        QuestionText(),
        Column(
          children: [
            TrueFalseButton(
              labelAndAnswer: 'True',
              selectedColor: Colors.greenAccent,
            ),
            SizedBox(height: deviceHeight! * 0.01),
            TrueFalseButton(
              labelAndAnswer: 'False',
              selectedColor: Colors.redAccent,
            ),
          ],
        ),
      ],
    );
  }
}
