import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.height,
    required this.width,
    required this.textTitle,
    required this.textValue,
    required this.onPressedAdd,
    required this.onPressedMinus,
  });

  final double? height;
  final double? width;
  final String textTitle;
  final String textValue;
  final void Function()? onPressedAdd;
  final void Function()? onPressedMinus;

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
            textTitle,
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            textValue,
            style: TextStyle(
              fontSize: 36,
              color: CupertinoColors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CupertinoButton(
                onPressed: onPressedMinus,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.systemRed,
                  ),
                ),
              ),
              SizedBox(width: 10),
              CupertinoButton(
                onPressed: onPressedAdd,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.systemGreen,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
