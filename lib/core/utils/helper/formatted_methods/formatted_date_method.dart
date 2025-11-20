import 'package:intl/intl.dart';

String formatDateMonthYear(String? date) {
  if (date == 'Unknown' || date == null) {
    return 'Unknown';
  }

  DateTime dateTime = DateTime.parse(date);
  return DateFormat('MMM yyy').format(dateTime);
}

String formatDateDayMonthYear(String? date) {
  if (date == 'Unknown' || date == null) {
    return 'Unknown';
  }
  DateTime dateTime = DateTime.parse(date);
  return DateFormat('dd MMM yyyy').format(dateTime);
}
