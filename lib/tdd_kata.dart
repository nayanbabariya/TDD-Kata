int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final integers = numbers.split(',');
  return integers.map(int.parse).reduce((a, b) => a + b);
}