import 'package:prompter_mj/src/option.dart';
import 'package:prompter_mj/src/terminal.dart';

// by defining the terminal object as final, we make sure it's not gonna be reassigned
// by defining the Terminal class as const, we make sure there is only one instance of it
// be making the _terminal as private, we make sure no one can access it outside of this class and even if they don't import the Terminal class but import the Prompter class, they could use it if we don't make this it private.
final Terminal _terminal = const Terminal();

class Prompter {
  dynamic askMultiple(String prompt, List<Option> options) {
    final input = _ask(prompt, options);

    try {
      return options[int.parse(input!)].value;
    } catch (e) {
      return askMultiple(prompt, options);
    }
  }

  bool askBinary(String prompt) {
    final input = _ask('\n$prompt (y/n)', []);

    return input!.toLowerCase().contains('y');
  }

  String? _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);

    return _terminal.collectInput();
  }
}
