import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';
import 'package:custom_horizontal_calendar/date_row.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  DateTime chosen = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CustomHorizontalCalendar(
                    onDateChoosen: (date) {
                      setState(() {
                        chosen = date;
                      });
                    },
                    inintialDate: DateTime.now(),
                    height: 60,
                    builder: (context, i, d, width) {
                      if (i != 2)
                        return DateRow(
                          d,
                          width: width,
                        );
                      else
                        return DateRow(
                          d,
                          background: Colors.blue,
                          selectedDayStyle: TextStyle(color: Colors.white),
                          selectedDayOfWeekStyle:
                              TextStyle(color: Colors.white),
                          selectedMonthStyle: TextStyle(color: Colors.white),
                          width: width,
                        );
                    },
                  ),
                  Text(
                    'chosen date',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat.yMd().format(chosen),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
