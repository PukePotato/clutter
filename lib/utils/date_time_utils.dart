import 'package:intl/intl.dart';

class DateTimeUtils {
  /// DateFormat in January 01, 2022
  static DateFormat localeFormat = DateFormat('MMMM dd, yyyy');

  static getDate(String dateTime) {
    try {
      return DateTime.parse(dateTime);
    } catch (e) {
      return null;
    }
  }

  static String getLocaleDate(DateTime dateTime) {
    return localeFormat.format(dateTime);
  }
}
