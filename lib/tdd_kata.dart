int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  if (numbers.startsWith('//')) {
    final delimiter = numbers.substring(2, numbers.indexOf('\n'));
    return numbers.substring(numbers.indexOf('\n') + 1)
        .split(RegExp(delimiter))
        .map(int.parse)
        .reduce((a, b) => a + b);
  }

  final integers = numbers.split(RegExp(r'[,\n]'));
  return integers.map(int.parse).reduce((a, b) => a + b);
}