import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/Microcard.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/widgets/customcard.dart';
import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/datecard.dart';
import 'package:flutter_application_1/pages/addmed.dart';
import 'package:flutter_application_1/pages/myremider.dart';

class Home extends StatefulWidget {
  //const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int value = 5;
  List<String> pills = ['pill 1', 'pill 2', 'pill 3'];
  List<String> description = ['for headache', 'for stomach', 'illnes'];
  List<String> theicons = [
    'drug.png',
    'inhaler.png',
    'pill.png',
    'pill_rounded.png',
    'syringe.png',
  ];

  DateTime _selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  @override
  Widget build(BuildContext context) {
    return PageFirstLayout(
        topChild: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 20,
                0,
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.width / 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyRemider()));
                    },
                    child: CustomCard(
                      icon: Image.asset(
                        'assets/calender.png',
                        width: 80,
                      ),
                      title: 'My Reminders',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddMed()));
                    },
                    child: CustomCard(
                      icon: Image.asset(
                        'assets/cabinet.png',
                        width: 80,
                      ),
                      title: 'My Pills',
                    ),
                  ),
                ])),
        containerChild: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 20,
              0, MediaQuery.of(context).size.width / 20, 0),
          child: ListView(children: [
            DateCard(_selectedDay),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                if (value == 0) ...[
                  Center(child: Text("no reminders today")),
                ] else ...[
                  for (int i = 0; i < 3; i++)
                    MicroCard(
                      id: i,
                      idshape: i + 1,
                      name: pills[i],
                      description: description[i],
                    ),
                ], /*
                    Card(
                margin: EdgeInsets.all(10),
                color: Colors.green[100],
                elevation: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.catching_pokemon)),
                      title: const Text('The Title'),
                      subtitle: const Text('The Subtitle'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                  ],
                ],
              ),/*
              Center(child: Text("no reminders today")),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.green[100],
                elevation: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.catching_pokemon)),
                      title: const Text('The Title'),
                      subtitle: const Text('The Subtitle'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ],
                ),*/
              )*/
              ],
            ),
          ]),
        ));
  }
}
