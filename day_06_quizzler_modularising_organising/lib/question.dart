class Question {
  String questionText;
  bool questionAnswer;

  // This single line is the same as the original constructor below (positional parameters)
  Question(this.questionText, this.questionAnswer);

  // named parameters:

  // late String questionText;
  // late bool questionAnswer;

  // Question({required String q, required bool a}) {
  //   questionText = q;
  //   questionAnswer = a;
  // }
}


// late:
// In Dart, we use the late keyword to declare variables that will be initialized later. These are called non-nullable variables as they are initialized after the declaration. Hence, we use the late keyword.