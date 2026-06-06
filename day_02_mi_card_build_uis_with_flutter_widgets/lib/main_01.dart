import 'package:flutter/material.dart';

void main() {
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          // place widgets outside the nudge area if one exists
          child: Column(
            // verticalDirection: VerticalDirection.down,
            // mainAxisSize: MainAxisSize.min, // don't occupy all the vertical space
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                height: 100,
                width: 100,
                // padding: EdgeInsets.all(50), // inside
                margin: EdgeInsets.all(20), // outside
                child: Text("Container 1"),
              ),
              SizedBox(height: 50), // space between two containers
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: Text("Container 2"),
              ),
              Container(
                color: Colors.yellow,
                height: 100,
                width: 100,
                child: Text("Container 3"),
              ),
              Container(width: double.infinity),
              // Since I have this invisible container with the width of infinity, and I define the horizontal alignment (cross) to be centered, then all other visible containers placed themselves in the middle of screen
            ],
          ),
        ),
      ),
    );
  }
}

// Note: everything we have done here with columns, can also be applied to the rows two, but we have to fix the height and width of course to makes sense
