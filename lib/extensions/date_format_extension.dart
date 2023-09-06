import 'package:intl/intl.dart';

/// An extension to add date and time formatting methods to String objects.
extension FormatDateExtension on String {
  /// Formats the date in "dd-MMM-yyyy" format.
  String get formatDate {
    try {
      final format = DateFormat("dd-MMM-yyyy").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "dd-MMM-yyyy";
    }
  }

  /// Formats the time in "hh:mm a" format.
  String get formatTime {
    try {
      final format = DateFormat.jm().format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "HH:MM";
    }
  }

  /// Gets the abbreviated month name (e.g., "Jan").
  String get month {
    try {
      final format = DateFormat("MMM").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "MMM";
    }
  }

  /// Gets the day of the month.
  int get day {
    try {
      final format = DateTime.parse(this);
      return format.day;
    } catch (e) {
      return -1;
    }
  }

  /// Gets the abbreviated day name (e.g., "Sun").
  String get dayName {
    try {
      final format = DateFormat("EEE").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "Invalid";
    }
  }

  /// Gets the year.
  String get year {
    try {
      final format = DateFormat("yyyy").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "yyyy";
    }
  }

  /// Formats the date in "dd, MMM yyyy" format.
  String get standardFormat {
    final format = DateFormat("dd, MMM yyyy").format(DateTime.parse(this));
    return format;
  }

  /// Provides a standard time format indicating how long ago the input time was.
  String get standardTime {
    try {
      final sec = DateTime.now().difference(DateTime.parse(this)).inSeconds;
      final min = sec / 60;
      final hour = min / 60;

      if (sec < 60) {
        return "(${sec.toStringAsFixed(1)} sec before)";
      } else if (min < 60 && min > 0) {
        return "(${min.toStringAsFixed(1)} min before)";
      } else {
        return "(${hour.toStringAsFixed(1)} hrs before)";
      }
    } catch (e) {
      return "Invalid";
    }
  }
}
