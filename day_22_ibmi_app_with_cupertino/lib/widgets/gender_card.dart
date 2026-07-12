import 'package:flutter/cupertino.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.height,
    required this.width,
    required this.textValue,
    required this.onValueChanged,
  });

  final double? height;
  final double? width;
  final int textValue;
  final void Function(int?) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: CupertinoColors.darkBackgroundGray, blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Gender',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          CupertinoSlidingSegmentedControl(
            groupValue: textValue,
            children: {0: Text('Male'), 1: Text('Female')},
            onValueChanged: onValueChanged,
          ),
        ],
      ),
    );
  }
}
