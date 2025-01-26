import 'package:tdd_kata/tdd_kata.dart';
import 'package:test/test.dart';

void main() {
  test('Should return 0 when empty string is provided', () {
    expect(add(''), 0);
  });

  test('Should return the input integer when a single number is provided', () {
    expect(add('1'), 1);
  });

  test('Should return the sum of 2 numbers when 2 comma separated numbers are provided', () {
    expect(add('1,2'), 3);
  });

  test('Should return the sum of all numbers when multiple comma separated numbers are provided', () {
    expect(add('1,2,3'), 6);
    expect(add('1,2,3,4'), 10);
  });
  
  test('Should return the sum of numbers when new line is used as separator instead of comma', () {
    expect(add('1\n2,3'), 6);
  });

  test('Should return the sum of numbers when a custom delimiter is used. Delimiter is specified at the beginning of the input', () {
    expect(add('//;\n1;2'), 3);
  });
}
