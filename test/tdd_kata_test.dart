import 'package:tdd_kata/tdd_kata.dart';
import 'package:test/test.dart';

void main() {
  test('Should return 0 when empty string is provided', () {
    expect(0, add(''));
  });

  test('Should return the input integer when a single number is provided', () {
    expect(1, add('1'));
  });

  test('Should return the sum of 2 numbers when 2 comma separated numbers are provided', () {
    expect(3, add('1,2'));
  });
}
