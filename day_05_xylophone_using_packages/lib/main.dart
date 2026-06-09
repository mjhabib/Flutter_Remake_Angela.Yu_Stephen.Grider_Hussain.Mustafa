import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// we can use this => arrow syntax (fat arrow) when we only have one single line of code to execute instead of {}
void main() => runApp(XylophoneAPP());

class XylophoneAPP extends StatelessWidget {
  const XylophoneAPP({super.key});

  // Expanded before our function name (buildKey) is the 'return type' of our function
  // by adding {} around our function inputs/params, we force the function call to use named parameters instead of positional parameters
  // adding the keyword 'required' won't force us to provide a default value because the compiler knows it’s mandatory
  Expanded buildKey({int noteNum = 1, required Color colorName}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              0,
              // Set to 0 means a sharp rectangle
            ),
          ),
          backgroundColor: colorName,
        ),
        onPressed: () async {
          final player = AudioPlayer();
          await player.play(AssetSource('note$noteNum.wav'));
          // AudioPlayer will add 'assets' directory automatically to my file's path;
        },
        child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(noteNum: 1, colorName: Colors.red),
              buildKey(noteNum: 2, colorName: Colors.orange),
              buildKey(noteNum: 3, colorName: Colors.yellow),
              buildKey(noteNum: 4, colorName: Colors.blue),
              buildKey(noteNum: 5, colorName: Colors.teal),
              buildKey(noteNum: 6, colorName: Colors.green),
              buildKey(noteNum: 7, colorName: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
