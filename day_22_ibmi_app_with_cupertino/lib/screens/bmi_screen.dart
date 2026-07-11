import 'package:flutter/cupertino.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(color: CupertinoColors.activeGreen),
    );
  }
}
