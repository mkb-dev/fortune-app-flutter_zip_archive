import 'package:flutter_zip_archive/flutter_zip_archive.dart';

void main() {
  testW('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
