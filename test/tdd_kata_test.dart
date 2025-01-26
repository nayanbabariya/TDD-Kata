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

  test('Should return the sum of all numbers when multiple comma separated numbers are provided', () {
    expect(6, add('1,2,3'));
    expect(10, add('1,2,3,4'));
  });
  
  test('Should return the sum of numbers when new line is used as separator instead of comma', () {
    expect(6, add('1\n2,3'));
  });

  test('Should return the sum of numbers when a custom delimiter is used. Delimiter is specified at the beginning of the input', () {
    expect(3, add('//;\n1;2'));
  });
}
