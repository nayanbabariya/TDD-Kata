import 'package:tdd_kata/exception.dart';
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

  test('Should throw an exception with the list of negative numbers when negative numbers are provided', () {
    final testCases = [
      (input: '-1,-2', exceptionMessageContains: '-1,-2'),
      (input: '1,-2', exceptionMessageContains: '-2'),
      (input: '-1\n2,3', exceptionMessageContains: '-1'),
      (input: '//*\n1*2*-3*-4', exceptionMessageContains: '-3,-4'),
    ];

    for (final testCase in testCases) {
      try {
        add(testCase.input);
      } catch (e) {
        expect(
          e,
          isA<NegativeNumberException>().having(
            (exception) => exception.message,
            'Exception message',
            contains(testCase.exceptionMessageContains),
          ),
        );
      }
    }
  });

  test('Should ignore the number bigger than 1000 in sum', () {
    expect(add('2,1001'), 2);
  });

  test('Should return the sum of numbers when a custom delimiter with any length is used', () {
    expect(add('//[***]\n1***2***3'), 6);
  });
}
