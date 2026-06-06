import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text("I am rich"),
          backgroundColor: Colors.green[900],
        ),
        body: Center(child: Image(image: AssetImage("images/diamond.png"))),
      ),
    ),
  );
}
