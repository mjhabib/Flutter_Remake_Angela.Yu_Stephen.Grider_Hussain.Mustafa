import 'package:flutter/material.dart';

import '../constants.dart';

class ReuseableIcon extends StatelessWidget {
  final String cardLabel;
  final IconData cardIcon;
  const ReuseableIcon({
    super.key,
    required this.cardLabel,
    required this.cardIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, size: 80),
        SizedBox(height: 15),
        Text(cardLabel, style: labelTextStyle),
      ],
    );
  }
}
