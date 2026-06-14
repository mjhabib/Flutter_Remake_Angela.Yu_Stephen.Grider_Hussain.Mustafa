import 'package:flutter/material.dart';

import 'constants.dart';
import 'reuseable_card.dart';
import 'reuseable_icon.dart';

// this how to create enums - to use -> Gender.male
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;

  // we can use a ternary operator inside widgets but if-else-statements has multiple lines of code, that's why we can not use them inside a widget

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateCardColor(CardGender selectedGender) {
  //   if (selectedGender == CardGender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == CardGender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          // 1. This how to apply a certain theme to a certain widget
          // style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    // ternary operator -> condition ? if true : if false
                    bgColor: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: ReuseableIcon(
                      cardLabel: "MALE",
                      cardIcon: Icons.male,
                    ),
                    onTapFun: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  // child: GestureDetector(
                  //   onTap: () => setState(() {
                  // // updateCardColor(CardGender.female);
                  //   selectedGender = Gender.female;
                  // }),
                  child: ReuseableCard(
                    bgColor: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: ReuseableIcon(
                      cardLabel: "FEMALE",
                      cardIcon: Icons.female,
                    ),
                    onTapFun: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              bgColor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    // to prevent error when we choose a baseline for our row, we have to pass a textBaseline param too
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numeralTextStyle),
                      SizedBox(width: 2),
                      Text("cm", style: labelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 280,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReuseableCard(bgColor: activeCardColor)),
                Expanded(child: ReuseableCard(bgColor: activeCardColor)),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsetsDirectional.only(top: 10),
            height: bottomContainerHeight,
            width: double.infinity,
          ),
        ],
      ),

      // 3. I can also change any widgets theme despite the app level theme (the whole app is dark but this button has a light theme)
      // floatingActionButton: Theme(
      //   data: ThemeData(colorScheme: ColorScheme.light()),
      //   child: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      // ),
    );
  }
}
