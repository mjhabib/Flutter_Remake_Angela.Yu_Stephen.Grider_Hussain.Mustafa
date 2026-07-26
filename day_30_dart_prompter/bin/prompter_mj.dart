import 'package:prompter_mj/prompter_mj.dart';

void main(List<String> arguments) {
  final options = [
    Option(label: 'I want red', value: '#f00'),
    Option(label: 'I want blue', value: '#00f'),
  ];

  final prompter = Prompter();

  final answerMultiple = prompter.askMultiple(
    'What color do you like?',
    options,
  );
  final answerBinary = prompter.askBinary('Do you like Dart?');

  print('\nYou chose the color: $answerMultiple');
  print('\nAnd your answer was: $answerBinary');
}
