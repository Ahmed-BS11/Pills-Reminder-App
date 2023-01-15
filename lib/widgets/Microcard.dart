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

class MicroCard extends StatefulWidget {
  final int id;
  final int idshape;
  final String name;
  final String description;

  MicroCard(
      {required this.id,
      required this.idshape,
      required this.name,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  State<MicroCard> createState() => _MicroCardState();
}

class _MicroCardState extends State<MicroCard> {
  var token;

  bool visibilityController = true;

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
  void initState() {
    DeleteData();
    super.initState();
  }
  @override
  _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(token);
  }

  DeleteData() async {
    await _checkToken();
    await DeletePills(token);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: visibilityController ? 1.0 : 0.0,
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.green[100],
        elevation: 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/' + theicons[widget.idshape]),
              ),
              title: Text(widget.name),
              subtitle: Text(widget.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          visibilityController = false;
                        });
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        DeletePills(widget.id);
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PostPill() async {
    //final String token =
    //   'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc1ODg3MTY3LCJpYXQiOjE2NzMyOTUxNjcsImp0aSI6IjMwZjQ4ZmMwZmJjYjRiZjU5MDAxNDFlNzljM2I1NjlkIiwidXNlcl9pZCI6MX0.8GjOdaRPPclMK6lf0SB7FCfAXJmFjcU2qHVf0m5rEW8';

    final Uri url = Uri.parse('http://127.0.0.1:8000/api/pills/create');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      "name": 'ahmed_Dwe',
      "dose": '3',
      "id_Shape": '2',
      "description": 'for pshyco',
      "refillOn": "10"
    });
    var body = json.decode(response.body);
  }

  DeletePills(id) async {
    final Uri url = Uri.parse('http://127.0.0.1:8000/api/pills/delete/$id');
    final response = await http.delete(url, headers: {
      "content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      // do something with the body
    } else {
      print(response.statusCode);
    }
  }
}
