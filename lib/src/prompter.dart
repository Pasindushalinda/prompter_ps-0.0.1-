import 'package:prompter_ps/src/option.dart';
import 'package:prompter_ps/src/terminal.dart';

final _terminal = const Terminal();

class Prompter {
  bool askBinary(String prompt) {
    final input = _ask('$prompt (y/n)', []);
    return input.contains('y');
  }

  askMultiple(String prompt, List<Option> options) {
    final input = _ask(prompt, options);

    try {
      return options[int.parse(input)].value;
    } catch (err) {
      return askMultiple(prompt, options);
    }
  }

  String _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOption(options);

    return _terminal.collectInput();
  }
}
