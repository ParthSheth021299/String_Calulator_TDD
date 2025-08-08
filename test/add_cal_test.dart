import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/add_cal.dart';

void main() {
  //Test case when the input is empty string.
  test("returns 0 ", () {
    expect(add(''), 0);
  });

  // Test case when the input is single number.
  test('returns the number itself for single number', () {
    expect(add('1'), equals(1));
  });

  //Test case for two string input.
  test('returns sum for two comma-separated numbers', () {
    expect(add('1,2'), equals(3));
  });
}
