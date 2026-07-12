import 'package:flutter/cupertino.dart';
import 'package:ibmi_app/widgets/calculate_button.dart';

import 'package:ibmi_app/widgets/info_card.dart';
import 'package:ibmi_app/widgets/height_card.dart';
import 'package:ibmi_app/widgets/gender_card.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double? deviceHeight, deviceWidth;
  int age = 25, weight = 62, height = 170, gender = 0;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Container(
        height: deviceHeight! * 0.95,
        color: CupertinoColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InfoCard(
                  height: deviceHeight! * 0.18,
                  width: deviceWidth! * 0.45,
                  textTitle: 'Age (yr)',
                  textValue: age.toString(),
                  onPressedAdd: () {
                    setState(() {
                      age++;
                    });
                  },
                  onPressedMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
                InfoCard(
                  height: deviceHeight! * 0.18,
                  width: deviceWidth! * 0.45,
                  textTitle: 'Weight (kg)',
                  textValue: weight.toString(),
                  onPressedAdd: () {
                    setState(() {
                      weight++;
                    });
                  },
                  onPressedMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
              ],
            ),
            HeightCard(
              height: deviceHeight! * 0.18,
              width: deviceWidth! * 0.90,
              sliderWidth: deviceWidth! * 0.80,
              textValue: height,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.toInt();
                });
              },
            ),
            GenderCard(
              height: deviceHeight! * 0.10,
              width: deviceWidth! * 0.90,
              textValue: gender,
              onValueChanged: (newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
            ),
            CalculateButton(height: deviceHeight! * 0.08, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
