
import 'package:intl/intl.dart';
import 'package:quiz_app/extensions/remove_Z_from_time.dart';
/// An extension to provide additional date-related methods to [DateTime] objects.
extension GetDateExt on DateTime {
  /// Gets the formatted date in "yyyy-MM-dd" format.
  ///
  /// Returns the date in the format "yyyy-MM-dd".
  String get getDate {
    /// Create a formatted date string in "yyyy-MM-dd" format using the [DateTime] values.
    final format = DateTime.utc(year, month, day).toIso8601String().removeZFromDate;
    return format;
  }

  /// Gets the formatted today's date in "yyyy-MM-dd" format.
  ///
  /// Returns the current date in the format "yyyy-MM-dd".
  String get todayDate {
    /// Get the day and month components of the current date, ensuring they are zero-padded.
    var day = DateTime.now().day.toString().padLeft(2, '0');
    var month = DateTime.now().month.toString().padLeft(2, '0');

    /// Construct the formatted date string in "yyyy-MM-dd" format.
    final date = "$year-$month-$day";
    return date;
  }

  /// Gets the formatted date of tomorrow in "yyyy-MM-dd" format.
  ///
  /// Returns the date of the next day in the format "yyyy-MM-dd".
  String get tomorrow {
    // Calculate the day of the next day, ensuring it is zero-padded.
    var nextDay = (day + 1).toString().padLeft(2, '0');
    var month = DateTime.now().month.toString().padLeft(2, '0');

    /// Construct the formatted date string in "yyyy-MM-dd" format for tomorrow.
    final date = "$year-$month-$nextDay";
    return date;
  }

  /// Gets the current month number (1 to 12).
  ///
  /// Returns the numeric value of the current month (1 to 12).
  int get currentMonthNum {
    /// Return the month component of the current date.
    return month;
  }

  /// Gets the current academic session in the "yyyy-yyyy" format.
  ///
  /// Returns the academic session based on the current date.
  String get currentSession {
    /// Determine the academic session based on the month of the current date.
    if (month >= 4) {
      final currentYear = year;
      final nextYear = year + 1;
      return "$currentYear-$nextYear";
    } else {
      return previousSession;
    }
  }

  /// Gets the previous academic session in the "yyyy-yyyy" format.
  ///
  /// Returns the academic session preceding the current session.
  String get previousSession {
    /// Determine the previous academic session based on the year of the current date.
    final previousYear = year - 1;
    return "$previousYear-$year";
  }

  /// Gets the abbreviated month name (e.g., "Jan").
  ///
  /// Returns the abbreviated name of the month based on the [DateFormat] "MMM".
  String get dateMonth {
    // Format the month of the [DateTime] object using the "MMM" format.
    final month = DateFormat("MMM").format(this);
    return month;
  }
}
