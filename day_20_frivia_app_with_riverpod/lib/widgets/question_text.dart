import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_unescape/html_unescape.dart';

import 'package:frivia_app/providers/quiz_brain.dart';

const TextStyle questionTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

class QuestionText extends ConsumerWidget {
  const QuestionText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unescape = HtmlUnescape();
    final quizBrain = ref.watch(quizBrainProvider);
    final questions = ref.read(quizBrainProvider.notifier);

    return quizBrain.when(
      data: (_) => Text(
        unescape.convert(questions.getCurrentQuestionText()),
        style: questionTextStyle,
      ),
      loading: () => CircularProgressIndicator(color: Colors.white),
      error: (err, stack) => Text('Error: $err', style: questionTextStyle),
    );
  }
}
