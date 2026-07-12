import 'package:flutter/cupertino.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({
    super.key,
    required this.height,
    required this.width,
    required this.sliderWidth,
    required this.textValue,
    required this.onChanged,
  });

  final double? height;
  final double? width;
  final double? sliderWidth;
  final int textValue;
  final void Function(double)? onChanged;

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
            'Height (cm)',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            textValue.toString(),
            style: TextStyle(
              fontSize: 36,
              color: CupertinoColors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            width: sliderWidth,
            child: CupertinoSlider(
              min: 40,
              max: 280,
              divisions: 240,
              value: textValue.toDouble(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
