import 'package:intl/intl.dart';

extension DateStringFormant on DateTime {
  /// Ex: "Mon 19, Apr"
  String get dayDayMonthFormat {
    
    try {
      return DateFormat("EEE d, MMM").format(this);
    } catch (e) {
      return "No Date Available";
    }
  }

  /// Ex: "Mon 19 Apr, 8:00 Pm"
  String get dayDayMonthHourFormat {
    try {
      return DateFormat("EEE d MMM, h:mm a").format(this);
    } catch (e) {
      return "No Date Available";
    }
  }

  /// Ex: "8:00 Pm"
  String get hourMinutesFormat {
    try {
      return DateFormat("h:mm a").format(this);
    } catch (e) {
      return "No Date Available";
    }
  }
}

extension StringDateExtension on String {
  /// Ex: "2022-04-19T00:00:00.000Z"
  DateTime get toDate {
    return DateTime.tryParse(this) ?? DateTime(2001);
  }

  /// Ex: "00:00:00.000Z"
  DateTime get toTime {
    return DateTime.tryParse("2024-01-01T$this") ?? DateTime(2001);
  }
}
