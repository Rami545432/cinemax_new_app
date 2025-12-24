import 'package:intl/intl.dart';

class FormattedDateMethods {
  static String formatDateMonthYear(String? date) {
    if (date == 'Unknown' || date == null || date == '_' || date == '') {
      return 'Unknown';
    }

    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMM yyy').format(dateTime);
  }

  static String formatDateDayMonthYear(String? date) {
    if (date == 'Unknown' || date == null || date == '_' || date == '') {
      return 'Unknown';
    }
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String formatDateYear(String? date) {
    if (date == 'Unknown' || date == null || date == '_' || date == '') {
      return 'Unknown';
    }
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('yyyy').format(dateTime);
  }
}
