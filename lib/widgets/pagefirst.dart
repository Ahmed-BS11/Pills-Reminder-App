
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/first.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/pages/addremider.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/medicine_add.dart';

class PageFirstLayout extends StatelessWidget {
  PageFirstLayout(
      {
        
        this.appBarTitle ='',
        this.appBarRight = const SizedBox(height: 0, width: 0),
        this.color = MyColors.Landing2,
        this.topChild =  const SizedBox(height: 0, width: 0) ,
        this.containerChild = const SizedBox(height: 0, width: 0) ,
      });

  final Widget topChild;
  final Widget containerChild;
  final Widget appBarRight;
  final String appBarTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    int _currentIndex=0;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        //leading: IconButton(icon: Icon(
          //Icons.arrow_back
        //),
        //onPressed: (){}
        //),
        
        toolbarHeight: 80,
        titleSpacing: 30,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.6,
            fontFamily:'Raleway',
          ),
        ),
        actions: [
          appBarRight
        ],
        elevation: 0.0,
        backgroundColor: color,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body:
      Column(
        children: [
        topChild,
        CurvedContainer(
            containerChild
      ),
        ],
      
    ),
    bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xff003049),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          //setState(() => _currentIndex = value);
          if (value == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          } else if (value == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => profile()));
          } else if (value == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Med_add()));
          } else if (value == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddRemider()));
          }
          ;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_queue),
            label: 'Add Pill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            label: 'Add Reminder',
          ),
        ],
      ),
    );
  }
 
}