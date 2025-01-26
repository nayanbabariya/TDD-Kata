import 'exception.dart';

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final verifyDelimiterRegExp = RegExp(r'^//(\[.*?\]|.)\n');
  String defaultDelimiters = ',|\n';
  var numberString = numbers;

  final match = verifyDelimiterRegExp.firstMatch(numbers);

  if (match != null) {
    final rawDelimiters = match.group(1)!;
    if (rawDelimiters.startsWith('[') && rawDelimiters.endsWith(']')) {
      final customDelimiterRegExp = RegExp(r'\[(.*?)\]');
      final delimiters = customDelimiterRegExp
          .allMatches(rawDelimiters)
          .map((m) => RegExp.escape(m.group(1)!))
          .toList();
      defaultDelimiters = delimiters.join('|');
    } else {
      defaultDelimiters = RegExp.escape(rawDelimiters);
    }
    numberString = numbers.substring(match.end);
  }

  final splitRegExp = RegExp(defaultDelimiters);

  final integerNumbers =
      numberString.split(splitRegExp).map((e) => int.parse(e)).toList();

  if (integerNumbers.any((n) => n < 0)) {
    throw NegativeNumberException(
        'Negative numbers not allowed ${integerNumbers.where((n) => n < 0).join(',')}');
  }

  return integerNumbers
      .reduce((sum, number) => sum + (number > 1000 ? 0 : number));
}
