import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final Function() onTapped;
  const CustomIconButton({
    super.key,
    required this.buttonIcon,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTapped,
      shape: CircleBorder(),
      elevation: 6,
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints(minWidth: 40, minHeight: 40),
      child: Icon(buttonIcon),
    );
  }
}
