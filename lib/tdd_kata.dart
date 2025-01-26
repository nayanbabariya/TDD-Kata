import 'exception.dart';

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  var delimiterExp = RegExp(r'[,\n]');
  late final List<String> integerStrings;

  if (numbers.startsWith('//')) {
    delimiterExp =
        RegExp(RegExp.escape(numbers.substring(2, numbers.indexOf('\n'))));
    integerStrings =
        numbers.substring(numbers.indexOf('\n') + 1).split(delimiterExp);
  } else {
    integerStrings = numbers.split(delimiterExp);
  }

  final integerNumbers = integerStrings.map(int.parse);

  if (integerNumbers.any((n) => n < 0)) {
    throw NegativeNumberException(
        'Negative numbers not allowed ${integerNumbers.where((n) => n < 0).join(',')}');
  }

  return integerStrings.map(int.parse).reduce((a, b) => a + b);
}
