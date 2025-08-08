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

  test('returns sum when numbers are separated by new lines', () {
    expect(add('1\n2\n3'), equals(6));
  });

  test('supports custom delimiter ;', () {
    expect(add("//;\n1;2"), equals(3));
  });

  test('supports custom delimiter |', () {
    expect(add("//|\n4|5|6"), equals(15));
  });

  test('throws exception for negative numbers with custom delimiter', () {
    expect(
      () => add("//;\n1;-2;4;-7"),
      throwsA(
        predicate(
          (e) =>
              e is Exception &&
              e.toString().contains("negatives not allowed: -2, -7"),
        ),
      ),
    );
  });
}
