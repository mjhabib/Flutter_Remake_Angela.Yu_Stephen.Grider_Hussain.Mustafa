import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_brain.g.dart';

@riverpod
String difficulty(Ref ref) => 'easy';

@riverpod
class QuizBrain extends _$QuizBrain {
  int currentQuestionNum = 0;

  @override
  Future<List<dynamic>?> build() async {
    return await _loadQuestions();
  }

  Future<List<dynamic>?> _loadQuestions() async {
    final difficulty = ref.watch(difficultyProvider);
    final url = Uri.https('opentdb.com', '/api.php', {
      'amount': '10',
      'type': 'boolean',
      'difficulty': difficulty,
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
    return questions[currentQuestionNum]['question'];
  }

  void checkCurrentAnswer(String answer) {
    final questions = state.value!;
    bool isCorrect = questions[currentQuestionNum]['correct_answer'] == answer;
    currentQuestionNum++;

    // Notify listeners
    // Not recommended but keeps the code simple
    state = AsyncData([...state.value!]);
    print(isCorrect ? 'correct' : 'incorrect');
  }
}

// Run: "dart run build_runner watch" OR "dart run build_runner build"
