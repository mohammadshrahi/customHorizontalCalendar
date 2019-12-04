import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_horizontal_calendar/date_helper.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:swipedetector/swipedetector.dart';

///the date picker widget
class CustomHorizontalCalendar extends StatefulWidget {
  ///the constructor
  CustomHorizontalCalendar(
      {@required this.inintialDate,
      this.height = _height,
      this.builder,
      this.onDateChoosen});
  final Duration after = _after;
  final Duration before = _before;
  final DateTime inintialDate;
  final double height;

  /// defualt after value
  static const Duration _after = Duration(days: 2);

  /// defualt before value
  static const Duration _before = Duration(days: 2);

  ///defualt height
  static const double _height = 50;

  ///builder[RawDateBuilder]
  final RawDateBuilder builder;

  ///on date choosen
  final OnDateChoosen onDateChoosen;
  @override
  State<StatefulWidget> createState() {
    return _CustomHorizontalCalendarState();
  }
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  ///size of the date picker in days
  int size;
  int initalDateIndex;
  DateTime initialDate;
  @override
  void initState() {
    super.initState();
    size = widget.after.inDays + widget.before.inDays + 1;
    initalDateIndex = widget.after.inDays;
    initialDate = widget.inintialDate;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraint) {
        print('width : ' + boxConstraint.maxWidth.toString());
        return SwipeDetector(
          onSwipeLeft: () {
            setState(() {
              initialDate = initialDate.add(Duration(days: 1));
              widget.onDateChoosen(initialDate);
            });

            print('leftSwip');
          },
          onSwipeRight: () {
            setState(() {
              initialDate = initialDate.add(Duration(days: -1));
              widget.onDateChoosen(initialDate);
            });
            print('rightSwip');
          },
          child: Container(
            height: widget.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, i) {
                return InkWell(
                    onTap: () async {
                      if (i == 2) {
                        if (Platform.isIOS) {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: initialDate.add(Duration(days: -365)),
                              maxTime: initialDate.add(Duration(days: 365)),
                              onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            setState(() {
                              initialDate = date;
                            });
                            widget.onDateChoosen(initialDate);

                            print('confirm $date');
                          }, currentTime: initialDate);
                        } else {
                          DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: initialDate.add(Duration(days: -365)),
                              lastDate: initialDate.add(Duration(days: 365)));
                          if (picked != null && picked != initialDate) {
                            setState(() {
                              setState(() {
                                initialDate = picked;
                              });
                              widget.onDateChoosen(initialDate);
                            });
                          }
                        }
                      }
                    },
                    child: widget.builder(
                        context,
                        i,
                        getCurrentDate(i, initalDateIndex, initialDate),
                        boxConstraint.maxWidth / 5));
/*             DateRow(getCurrentDate(i, initalDateIndex, initialDate))
 */
              },
            ),
          ),
          swipeConfiguration: SwipeConfiguration(
              horizontalSwipeMaxHeightThreshold: 100.0,
              horizontalSwipeMinDisplacement: 50.0,
              horizontalSwipeMinVelocity: 100.0),
        );
      },
    );
  }
}

typedef RawDateBuilder = Widget Function(
    BuildContext context, int index, DateTime rawDateTime, double maxWidth);
typedef OnDateChoosen = void Function(DateTime dateChoosen);

///
void startAndroidDatePicker(
  BuildContext context,
) async {}
