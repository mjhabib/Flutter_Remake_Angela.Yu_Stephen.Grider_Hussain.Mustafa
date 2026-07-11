import 'package:flutter/cupertino.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  final double? height;
  final double? width;
  final Widget child;

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
      child: child,
    );
  }
}
