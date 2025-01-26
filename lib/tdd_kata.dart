int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  var delimiterExp = RegExp(r'[,\n]');
  late final List<String> integerStrings;

  if (numbers.startsWith('//')) {
    delimiterExp = RegExp(numbers.substring(2, numbers.indexOf('\n')));
    integerStrings =
        numbers.substring(numbers.indexOf('\n') + 1).split(delimiterExp);
  } else {
    integerStrings = numbers.split(delimiterExp);
  }

  return integerStrings.map(int.parse).reduce((a, b) => a + b);
}
