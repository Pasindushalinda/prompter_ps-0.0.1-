import 'package:prompter_ps/prompter_ps.dart';

void main() {
  final options = [
    new Option('I want red', '#00f'),
    new Option('I want blue', '#f00'),
  ];

  final prompter = Prompter();
  final colorCode = prompter.askMultiple('Select a color', options);
  final answer = prompter.askBinary('Do you like this lib?');
  print(colorCode);
  print(answer);
}
