import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_brain.g.dart';

@riverpod
class QuizBrain extends _$QuizBrain {
  List? questions;
  int currentQuestionNum = 0;

  @override
  Future<List<dynamic>> build(String difficulty) async {
    return await _loadQuestions(difficulty: difficulty);
  }

  Future<List<dynamic>> _loadQuestions({required String difficulty}) async {
    final url = Uri.https('opentdb.com', '/api.php', {
      'amount': '10',
      'type': 'boolean',
      'difficulty': difficulty,
    });

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load questions');
    }

    var json = jsonDecode(response.body);
    return questions = json['results'];
  }

  String getCurrentQuestionText() {
    return questions![currentQuestionNum]['question'];
  }
}

// Run: "dart run build_runner watch" OR "dart run build_runner build"
