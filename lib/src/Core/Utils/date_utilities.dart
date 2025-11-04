import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class DateUtilities {
  DateUtilities._();
  static get instance => DateUtilities._();

  /// ------------------------------ date --------------------------------------
  static String timestampFormatToDate(String timeStamp) {
    DateTime textToDate = DateTime.parse(timeStamp);
    return DateFormat.yMd().add_jm().format(textToDate);
  }

  ///takes date and returns something like :  2013-04-20
  static String convertDateToYMD(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    printDM(formatted);
    return formatted;
  }

  static String convertTimeToAmPm(String time) {
    // time must be in format like "14:15:00"
    final format = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time));
    printDM(format);
    return format;
  }

  static String convertDateToTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  static String convertDateToTime24(DateTime date) {
    return DateFormat('Hm').format(date);
  }

  static String convertDateToTimeAndAddHours(DateTime date, int hour) {
    DateTime endDate = date.add(Duration(hours: hour));
    return DateFormat('h:mm a').format(endDate);
  }

  static String convertDateToTimeAndAddHours24(DateTime date, int hour) {
    DateTime endDate = date.add(Duration(hours: hour));
    return DateFormat('Hm').format(endDate);
  }

  static String convertDurationToDay(int difference) {
    const int month = 30;
    if (difference >= 0 && difference < month) {
      return "$difference   ${difference == 1 ? "day".tr : "days".tr}";
    } else if (difference >= month && difference < 365) {
      final int inMonths = (difference / 30).floor();
      return "$inMonths   ${inMonths == 1 ? "month".tr : "months".tr}";
    } else {
      final int inYears = (difference / 365).floor();
      return "$inYears  ${inYears == 1 ? "year".tr : "years".tr}";
    }
  }

  /// calculate age from your birthdate
  static String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  static String formatDurationIntoTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  /// returns something like 1:00:00
  static String formatSecondsIntoDate(int seconds) {
    return formatDurationIntoTime(Duration(seconds: seconds)).toString();
  }

  DayTime getDayTime(DateTime time) {
    if (time.isAfter(DateTime(time.year, time.month, time.day, 12))) {
      return DayTime.afternoon;
    } else if (time.isAfter(DateTime(time.year, time.month, time.day, 6))) {
      return DayTime.morning;
    } else {
      return DayTime.evening;
    }
  }
}

enum DayTime { morning, afternoon, evening }
