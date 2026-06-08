import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text("Dicee", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple.shade700,
        ),
        body: DiceeAPP(),
      ),
    ),
  );
}

// stateless -> parts of the program meant to be the same (like appBar)
// stateful -> parts of the program meant to change (like our dice)
class DiceeAPP extends StatefulWidget {
  const DiceeAPP({super.key});

  @override
  State<DiceeAPP> createState() => _DiceeAPPState();
}

class _DiceeAPPState extends State<DiceeAPP> {
  // if I define my variables outside of this build method, it won't hot reload, (deponds on what I'm gonna do with them)
  int leftDiceNum = 3;
  int rightDiceNum = 6;

  void randomDice() {
    // setState -> required to call the build method for recent changes
    setState(() {
      // Random -> 0 - 5 == 1 - 6
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: randomDice,
              child: Image.asset("assets/dice$leftDiceNum.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: randomDice,
              child: Image(image: AssetImage("assets/dice$rightDiceNum.png")),
            ),
          ),
        ],
      ),
    );
  }
}

// a void callback or an anonymous function:  () {}
// it has no input, name, and does not return anything
