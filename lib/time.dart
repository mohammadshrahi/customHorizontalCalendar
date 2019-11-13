import 'package:intl/intl.dart';

/// time helper class
class Time {
  /// parse time hour
  DateTime parseTimeHour(String timeHour) {
    final DateTime now = Time().currentDateTime();
    final DateTime timeFormatted = DateFormat.Hms('en').parse(timeHour);
    final DateTime time = DateTime(
        now.year, now.month, now.day, timeFormatted.hour, timeFormatted.minute);
    // if (is24Format) {
    //   time = time.add(Duration(hours: 12));
    // }
    return time;
  }

  /// format time hour
  String formatTimeHour(String timeHour, {bool is24Format = false}) {
    final DateTime now = Time().currentDateTime();
    final DateTime timeFormatted = DateFormat.Hms('en').parse(timeHour);
    DateTime time = DateTime(
        now.year, now.month, now.day, timeFormatted.hour, timeFormatted.minute);
    if (is24Format) {
      time = time.add(const Duration(hours: 12));
    }
    return DateFormat.Hm('en').format(time);
  }

  /// today origional
  String todayOrdinal() {
    final DateTime now = Time().currentDateTime();
    String suffix = 'th';
    final int digit = now.day % 10;
    if ((digit > 0 && digit < 4) && (now.day < 11 || now.day > 13)) {
      suffix = <String>['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("E, MMM d'$suffix'", 'en').format(now); // 'Sun, Jun 30th'
  }

  /// return local current time
  DateTime currentDateTime() {
    return DateTime.now().toLocal();
  }

  /// current date
  String currentDate(String localString) {
    return DateFormat('yyyy-MM-dd', localString).format(currentDateTime());
  }

  /// current time
  String currentTime(String localString) {
    return DateFormat('yyyy-MM-dd', localString).format(currentDateTime());
  }

  /// print time
  void printTime() {
    final DateTime now = Time().currentDateTime();
    print(
        'H:${now.hour} M:${now.minute} S:${now.second} MS:${now.millisecond}');
    print(currentDateTime());
  }
}

void main(List<String> args) {
  // dart lib\utils\time.dart
}
