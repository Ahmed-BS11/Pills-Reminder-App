import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/widgets/customcard.dart';
import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/datecard.dart';
import 'package:flutter_application_1/pages/addmed.dart';
import 'package:flutter_application_1/pages/myremider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderCard extends StatefulWidget {
  final int id;
  final String pickedTime;

  final String name;
  final String description;

  ReminderCard(
      {required this.id,
      required this.name,
      required this.description,
      required this.pickedTime,
      Key? key})
      : super(key: key);

  @override
  State<ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  var token;

  @override
  void initState() {
    getData();
    super.initState();
  }

  _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(token);
  }

  getData() async {
    await _checkToken();
    //await getPills();
  }

  final List<String> theicons = [
    'drug.png',
    'inhaler.png',
    'pill.png',
    'pill_rounded.png',
    'syringe.png',
    'drug.png',
    'inhaler.png',
    'pill.png',
    'pill_rounded.png',
    'syringe.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: MyColors.Landing1,
      elevation: 20,
      
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.av_timer)),
                title: Text("name"),
                subtitle: Text("description"),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ignore: prefer_const_constructors
                    Text("15:00"),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void deleteReminder() async {
    final String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc1ODg3MTY3LCJpYXQiOjE2NzMyOTUxNjcsImp0aSI6IjMwZjQ4ZmMwZmJjYjRiZjU5MDAxNDFlNzljM2I1NjlkIiwidXNlcl9pZCI6MX0.8GjOdaRPPclMK6lf0SB7FCfAXJmFjcU2qHVf0m5rEW8';

    final Uri url =
        Uri.parse('http://127.0.0.1:8000/api/reminders/delete/${widget.id}');
    final response =
        await http.post(url, headers: {'Authorization': 'Bearer $token'});
  }
}
