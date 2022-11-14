import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/widgets/customcard.dart';
import 'package:flutter_application_1/widgets/curved.dart';

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PageFirstLayout(

      topChild: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width / 20,0,MediaQuery. of(context). size. width / 20, MediaQuery. of(context). size. width / 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           
               CustomCard(
                icon: Image.asset(
                  'assets/calender.png',
                  width: 80,
                ),
                title: 'My Reminders',
              ),
                CustomCard(
                icon: Image.asset(
                  'assets/cabinet.png',
                  width: 80,
                ),
                title: 'My Pills',
              ),
          ]
            
        )
        )
      );
  }
}