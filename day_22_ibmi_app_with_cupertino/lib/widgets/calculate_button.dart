import 'package:flutter/cupertino.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.height,
    required this.onPressed,
  });

  final double? height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: height,
      child: CupertinoButton.filled(
        onPressed: onPressed,
        child: Text(
          'Calculate BMI',
          style: TextStyle(
            fontSize: 16,
            color: CupertinoColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
