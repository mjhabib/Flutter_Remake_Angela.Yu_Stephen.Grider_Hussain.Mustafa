import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frivia_app/providers/quiz_brain.dart';
import 'package:frivia_app/screens/game_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  double? _deviceHeight, _deviceWidth;
  double currentDifficultyLevel = 0;
  final List<String> difficultyTexts = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [appTitle(), difficultySlider(), startGameButton()],
            ),
          ),
        ),
      ),
    );
  }

  Widget appTitle() {
    return Column(
      children: [
        const Text(
          "Frivia",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          difficultyTexts[currentDifficultyLevel.toInt()],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget difficultySlider() {
    return Slider(
      label: difficultyTexts[currentDifficultyLevel.toInt()],
      min: 0,
      max: 2,
      divisions: 2,
      value: currentDifficultyLevel,
      onChanged: (value) {
        setState(() {
          currentDifficultyLevel = value;
        });
      },
    );
  }

  Widget startGameButton() {
    return MaterialButton(
      onPressed: () {
        ref
            .read(difficultyProvider.notifier)
            .change(difficultyTexts[currentDifficultyLevel.toInt()]);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return GameScreen();
            },
          ),
        );
      },
      color: Colors.blue,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "Start",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
