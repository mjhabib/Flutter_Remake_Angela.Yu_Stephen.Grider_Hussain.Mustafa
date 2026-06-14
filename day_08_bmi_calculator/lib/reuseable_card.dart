// since our stateless widgets are immutable (unchangeable) we have to define our variables with the keyword 'final' to make sure it's not gonna change (and prevent any errors)
// we can also use the keyword 'const' but since the const is a pre-compiled variable, the value can not be changed during runtime
// on the other hand, the keyword 'final' can have a different value during runtime but in code level, we can not re-assign any value to it
// both 'const' and 'final' can be defined once
// Ex: I can define a final variable with "DateTime().now" but I can not assign it to a const since the time with be calculated during runtime

import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color? bgColor;
  final Widget? cardChild;
  final GestureTapCallback? onTapFun;
  const ReuseableCard({super.key, this.bgColor, this.cardChild, this.onTapFun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFun,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: cardChild,
      ),
    );
  }
}
