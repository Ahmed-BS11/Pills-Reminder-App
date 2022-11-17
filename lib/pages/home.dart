import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/widgets/customcard.dart';
import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/datecard.dart';
import 'package:flutter_application_1/pages/addmed.dart';


class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    DateTime _selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
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
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>AddMed()));
                  },
                  child: CustomCard(
                  icon: Image.asset(
                    'assets/cabinet.png',
                    width: 80,
                  ),
                  title: 'My Pills',
                              ),
                ),
          ]
            
        )
        ),
        containerChild: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width / 20,0, MediaQuery. of(context). size. width / 20,0 ),
        child: ListView(
          children: [
            DateCard(_selectedDay),
            SizedBox(height: 32),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
               ),
               SizedBox(
                height: 50,
               ),
               Center(child: 
               Text("no reminders today")),

               ],
        ),
        )
      );
  }
}