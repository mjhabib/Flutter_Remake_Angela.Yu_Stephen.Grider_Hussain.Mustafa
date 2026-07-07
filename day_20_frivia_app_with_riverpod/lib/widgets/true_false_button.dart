import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frivia_app/providers/quiz_brain.dart';

class TrueFalseButton extends ConsumerWidget {
  const TrueFalseButton({
    super.key,
    required this.labelAndAnswer,
    required this.selectedColor,
  });

  final String labelAndAnswer;
  final Color selectedColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: () {
        ref.read(quizBrainProvider.notifier).checkCurrentAnswer(labelAndAnswer);
      },
      color: selectedColor,
      minWidth: deviceWidth * 0.80,
      height: deviceHeight * 0.10,
      child: Text(
        labelAndAnswer,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
