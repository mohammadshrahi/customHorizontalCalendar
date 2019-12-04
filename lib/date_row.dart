import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///raw in datePicker
class DateRow extends StatelessWidget {
  ///constructor
  DateRow(this.dateTime,
      {this.background,
      this.selectedDayOfWeekStyle,
      this.selectedDayStyle,
      this.selectedMonthStyle,
      this.width});

  ///
  final double width;

  ///backgroundcolor
  final Color background;

  ///row date
  final DateTime dateTime;

  ///selected  month style
  final TextStyle selectedMonthStyle;

  ///selected day style
  final TextStyle selectedDayStyle;

  ///selected weekDay style
  final TextStyle selectedDayOfWeekStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: background,
        width: width,
        child: Padding(
            padding: EdgeInsets.only(right: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      DateFormat('EEE').format(dateTime),
                      style: selectedDayOfWeekStyle,
                    ),
                    Text(
                      dateTime.day.toString(),
                      style: selectedDayStyle,
                    ),
                    Text(
                      DateFormat('MMM').format(dateTime),
                      style: selectedMonthStyle,
                    )
                  ],
                ),
              ],
            )));
  }
}
