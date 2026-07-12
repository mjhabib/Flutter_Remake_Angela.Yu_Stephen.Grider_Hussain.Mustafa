import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/widgets/history_card.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  double? deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Center(
        child: HistoryCard(
          height: deviceHeight! * 0.25,
          width: deviceWidth! * 0.75,
        ),
      ),
    );
  }
}
