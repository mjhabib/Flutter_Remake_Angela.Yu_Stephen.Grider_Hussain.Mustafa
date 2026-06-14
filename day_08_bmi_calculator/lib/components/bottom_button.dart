import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final GestureTapCallback onTap;
  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        margin: EdgeInsetsDirectional.only(top: 10),
        padding: EdgeInsets.only(bottom: 15),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
