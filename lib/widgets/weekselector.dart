import 'package:flutter/material.dart';

class WeekdaySelector extends StatefulWidget {
  @override
  _WeekdaySelectorState createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  int _selectedIndex = 0;
  List<String>weekdays=['mon',"tue","wed","thu","fri","sun","sat"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            color: _selectedIndex == index ? Colors.blue : Colors.white,
            child: Center(
              child: Text(weekdays[index]),
            ),
          ),
        );
      },
    );
  }
}