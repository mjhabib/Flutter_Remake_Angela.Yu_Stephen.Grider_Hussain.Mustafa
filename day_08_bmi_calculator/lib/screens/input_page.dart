import 'package:flutter/material.dart';

import '../calculator.dart';
import '../constants.dart';
import '/screens/results_page.dart';
import '/components/bottom_button.dart';
import '../components/reuseable_card.dart';
import '../components/reuseable_icon.dart';
import '../components/custom_icon_button.dart';

// this how to create enums - to use -> Gender.male
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 150;
  int weight = 60;
  int age = 30;

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
                  SliderTheme(
                    // if we're not happy with some of the default values for this widget, we can customize it with this SliderTheme
                    // if I had more than one slider, I could move this custom theme in my main.dart theme for project-wide effect
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29eb1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 280,
                      inactiveColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    bgColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: labelTextStyle),
                        Text(weight.toString(), style: numeralTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              buttonIcon: Icons.remove,
                              onTapped: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            CustomIconButton(
                              buttonIcon: Icons.add,
                              onTapped: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    bgColor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: labelTextStyle),
                        Text(age.toString(), style: numeralTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              buttonIcon: Icons.remove,
                              onTapped: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            CustomIconButton(
                              buttonIcon: Icons.add,
                              onTapped: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
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
