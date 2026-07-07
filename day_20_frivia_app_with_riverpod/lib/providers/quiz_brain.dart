import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_brain.g.dart';

@riverpod
String difficulty(Ref ref) => 'easy';

@riverpod
class QuizBrain extends _$QuizBrain {
  int currentQuestionNum = 0;
  int totalQuestions = 10;

  @override
  Future<List<dynamic>?> build() async {
    return await _loadQuestions();
  }

  Future<List<dynamic>?> _loadQuestions() async {
    final difficulty = ref.watch(difficultyProvider);
    final url = Uri.https('opentdb.com', '/api.php', {
      'type': 'boolean',
      'difficulty': difficulty,
      'amount': totalQuestions.toString(),
    });

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return json['results'];
      } else {
        print('Server error: ${response.statusCode}');
        return null; // Return null instead of crashing
      }
    } catch (e) {
      print('Network error: $e');
      return null;
    }
  }

  String getCurrentQuestionText() {
    final questions = state.value!;

    if (state.isLoading || state.hasError || state.value == null) {
      return "Loading...";
    }

    return questions[currentQuestionNum]['question'];
  }

  bool checkCurrentAnswer(String answer) {
    final questions = state.value!;
    bool isCorrect = questions[currentQuestionNum]['correct_answer'] == answer;

    if (currentQuestionNum < totalQuestions - 1) {
      currentQuestionNum++;

      // Notify Riverpod that the state has changed (to refresh UI)
      state = AsyncData([...state.value!]);
    } else {
      // We reached the end.
      // We don't increment anymore to avoid Index Error.
      // We reset for the next round.
      currentQuestionNum = 0;
      state = AsyncData([...state.value!]);
    }

    return isCorrect;
  }

  bool gameOver() {
    return currentQuestionNum == 0 && state.value != null;
  }
}

// Run: "dart run build_runner watch" OR "dart run build_runner build"
