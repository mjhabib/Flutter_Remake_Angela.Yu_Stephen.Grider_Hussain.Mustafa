import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/widgets/info_card.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double? deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Container(
        color: CupertinoColors.white,
        child: Center(
          child: InfoCard(
            height: deviceHeight! * 0.20,
            width: deviceWidth! * 0.45,
            child: Column(),
          ),
        ),
      ),
    );
  }
}
