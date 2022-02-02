import 'package:intl/intl.dart';

class FormatterHelper {
  FormatterHelper._();

  static String format(num value) {
    final currency = NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
    final result = currency.format(value);
    return result;
  }
}
