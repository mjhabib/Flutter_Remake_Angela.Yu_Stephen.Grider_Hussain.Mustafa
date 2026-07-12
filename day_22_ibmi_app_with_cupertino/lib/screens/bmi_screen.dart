import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ibmi_app/widgets/info_card.dart';
import 'package:ibmi_app/widgets/height_card.dart';
import 'package:ibmi_app/widgets/gender_card.dart';
import 'package:ibmi_app/widgets/calculate_button.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double? deviceHeight, deviceWidth;
  int age = 25, weight = 62, height = 170, gender = 0;

  void calculateBMI() {
    String? health;
    if (age > 0 && weight > 0 && height > 0) {
      double bmi = (weight / pow(height, 2) * 10000);

      if (bmi < 18.5) {
        health = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        health = 'Healthy';
      } else if (bmi >= 25 && bmi < 29.9) {
        health = 'Overweight';
      } else if (bmi >= 30) {
        health = 'Obese';
      }
      setState(() {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(health!),
              content: Text(bmi.toStringAsFixed(2)),
              actions: [
                CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    saveResults(bmi.toStringAsFixed(2), health!);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      });
    }
  }

  void saveResults(String bmi, String health) async {
    final prefs = await SharedPreferences.getInstance();

    final today = DateTime.now();
    await prefs.setString(
      'date',
      '${today.month}/${today.day}/${today.year} - ${today.hour}:${today.minute}',
    );
    await prefs.setStringList('data', <String>[bmi, health]);
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Container(
        padding: EdgeInsets.only(top: deviceHeight! * 0.02),
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
            CalculateButton(
              height: deviceHeight! * 0.08,
              onPressed: calculateBMI,
            ),
          ],
        ),
      ),
    );
  }
}
