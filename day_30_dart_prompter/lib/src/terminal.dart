import 'dart:io';

import 'package:prompter_mj/src/option.dart';

class Terminal {
  const Terminal();

  void printPrompt(String prompt) {
    // we don't use print here because it's reserved for debugging purposes
    // writeln -> prints the prompt + a newline
    stdout.writeln(prompt);
  }

  void printOptions(List<Option> options) {
    // to prevent mistakes we can use dart's helper methods for such functionalities
    // for (var i = 0; i < options.length; i++) {
    //   stdout.writeln('[$i] - ${options[i].label}');
    // }

    // for example we can simply use a forEach method here
    // but since it doesn't return an index (which we need)
    // ... we can convert our list to a map first then iterate over each key/value
    options.asMap().forEach((index, option) {
      stdout.writeln('[$index] - ${option.label}');
    });

    stdout.writeln('Enter a choice:\n');
    stdout.write('> ');
  }

  String? collectInput() {
    return stdin.readLineSync();
  }

  void clearScreen() {
    if (Platform.isWindows) {
      // write -> only prints an input (without a newline)
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }
}
