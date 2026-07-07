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
      onPressed: () async {
        final bool isCorrect = ref
            .read(quizBrainProvider.notifier)
            .checkCurrentAnswer(labelAndAnswer);

        // Crucial check for async gaps
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                title: Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel_sharp,
                  color: Colors.white,
                ),
              );
            },
          );
          await Future.delayed(Duration(seconds: 1));
          if (context.mounted) {
            Navigator.pop(context);
          }
        }
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
