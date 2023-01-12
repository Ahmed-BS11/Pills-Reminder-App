// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/addremider.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/medicine_add.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyProfilePage(),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  @override
  UserProfile createState() => UserProfile();
}

class UserProfile extends State<MyProfilePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    TextEditingController names = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 229, 227, 1),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0),
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 85.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: names,
                        decoration: InputDecoration(
                            labelText: 'Names',
                            prefixIcon: Icon(Icons.person),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: username,
                        decoration: InputDecoration(
                            labelText: 'username',
                            prefixIcon: Icon(Icons.people),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: 'email',
                            prefixIcon: Icon(Icons.email),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                            labelText: 'password',
                            prefixIcon: Icon(Icons.password),
                            border: myInputBorder(),
                            enabledBorder: myInputBorder(),
                            focusedBorder: myFocusBorder()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(Icons.update_outlined),
                              Text('Update')
                            ],
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              //side: BorderSide(color: Colors.red)),
                            )),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              Icon(Icons.exit_to_app),
                              Text('LogOut',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              //side: BorderSide(color: Colors.red)),
                            )),
                          ),

                          /*primary: Color.fromARGB(255, 119, 161, 202),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(10),
                                  
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),*/
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: <Widget>[
                ClipOval(
                    child: Image.asset(
                  'assets/men.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )),
                Positioned(
                  top: 5,
                  right: 15.5,
                  child: Container(
                      padding: EdgeInsets.all(5.00),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey, shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit,
                        size: 30.0,
                      )),
                )
              ],
            ),
          ),
        ]),
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
          setState(() => _currentIndex = value);
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

  OutlineInputBorder myInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color(0xff003049),
          width: 3,
        ));
  }

  OutlineInputBorder myFocusBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color(0xff003049),
          width: 3,
        ));
  }
}
