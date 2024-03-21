import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number, [int decimal = 0]) {
    final formattNumber = NumberFormat.compactCurrency(
            decimalDigits: decimal, symbol: '', locale: 'en')
        .format(number);
    return formattNumber;
  }
}
