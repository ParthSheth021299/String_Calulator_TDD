import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/add_cal.dart';

void main() {
  test("returns 0 ", () {
    expect(add(''), 0);
  });
}
