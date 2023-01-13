import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/widgets/Remindercard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/pages/addremider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_1/widgets/datecard.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRemider extends StatefulWidget {
  const MyRemider({super.key});

  @override
  State<MyRemider> createState() => _MyRemiderState();
}

class _MyRemiderState extends State<MyRemider> {
  List<String> Rmnames = [];
  List<String> des = [];
  List<int> Rmids = [];
  List<String> pickedtimes = [];
  int value = 5;

  var data = [];
  @override
  void initState() {
    getReminders();
    super.initState();
  }

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.bottomCenter,

      child: PageFirstLayout(
          appBarTitle: "My Reminders",
          color: MyColors.Landing1,
          appBarRight: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return (AddRemider());
                    },
                  ),
                );
              }),
          topChild: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                    titleTextStyle: Theme.of(context).textTheme.bodyText2!,
                    formatButtonTextStyle: Theme.of(context).textTheme.overline!,
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                    CalendarFormat.week: 'Week'
                  },
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: Theme.of(context).textTheme.caption!,
                    weekendStyle: Theme.of(context).textTheme.caption!,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                        color: MyColors.TealBlue, shape: BoxShape.circle),
                    todayDecoration: BoxDecoration(
                        color: MyColors.TealBlue.withOpacity(0.5),
                        shape: BoxShape.circle),
                  ),
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.now().add(Duration(days: 7300)),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  onDaySelected: _onDaySelected,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                ),
              ),
              //Text(data.toString()),
              
             
            ],
          ),
          containerChild: Container(
            child:Wrap(
              children: [
                 Column(
                  children: data.map(((e) {
                    Rmids.add(e["_id"]);
                    des.add(e["pill"]["description"]);
                    Rmnames.add(e["pill"]["name"]);
                    pickedtimes.add(e["pickedTime"]);
                    Text(Rmnames.toString());
                    return Text("");
                    
                  })).toList(),
                  
                ),
                Column(
                  children: [
                    if (value == 0) ...[
                      Center(child: Text("no reminders today")),
                    ] else ...[
                      for (int i = 0; i < Rmids.length; i++)
                        ReminderCard(
                          id: Rmids[i],
                          pickedTime: pickedtimes[i],
                          name: Rmnames[i],
                          description: des[i],
                        ),
                    ],
                  ],
                ),
              ],),
            )
            //crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
    );
  }

  void getReminders() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc2MTI1MDM5LCJpYXQiOjE2NzM1MzMwMzksImp0aSI6ImRkMGVlMzgwYmFkMDQ4ZDU4MzIxNzlkY2FjZmMxODc3IiwidXNlcl9pZCI6MX0.n_r3LOdv7I3iEZzzyXE91woyw_24k0yNlOJPUTfidQs";
    final Uri url = Uri.parse('http://127.0.0.1:8000/api/reminders/');

    final response = await http.get(
      url,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    var body = json.decode(response.body);
    setState(() {
      data = body;
    });
  }
}
