// =============== Abstraction ====================
// showing only the important parts and hiding the details
// that's why we created separate classes

import 'package:flutter/material.dart';
import 'question_brain.dart';
import 'alert_dialog.dart';

QuestionBrain questionBrain = QuestionBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

// I can also change the data type of this list to 'Icon' if I want because Icon is also a Widget so it works in both cases
// if I press one of the buttons, it'll add a new icon to this list
List<Widget> scoreKeeper = [
  // Icon(Icons.check, color: Colors.green),
  // Icon(Icons.close, color: Colors.red),
];

int numOfCorrectAnswers = 0;

// State class
class _QuizPageState extends State<QuizPage> {
  // since this function has setState inside it, it MUST be defined inside this State class to work
  void checkAnswer(bool answer) {
    bool correctAnswer = questionBrain.getQuestionAnswer();

    setState(() {
      if (questionBrain.isFinished() == true) {
        int numOfQuestions = questionBrain.numOfQuestions();

        DialogHelper dialogHelper = DialogHelper(
          numOfCorrectAnswers,
          numOfQuestions,
        );

        dialogHelper.showAlertDialog(context);
        scoreKeeper = [];
        numOfQuestions = 0;
        numOfCorrectAnswers = 0;
      } else {
        if (correctAnswer == answer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
          numOfCorrectAnswers++;
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }

        questionBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => checkAnswer(true),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => checkAnswer(false),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
