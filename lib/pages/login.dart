import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgotpassword.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/newaccount.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/widgets/customcard.dart';
import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/datecard.dart';
import 'package:flutter_application_1/pages/addmed.dart';
import 'package:flutter_application_1/pages/newaccount.dart';
import 'package:flutter_application_1/pages/forgotpassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  void initState() {
    super.initState();
    _checkToken();}
  _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
  /*void didChangeDependencies() async {
    super.didChangeDependencies();
    final prefs = await SharedPreferences.getInstance();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString("token");
    int iii=0;
    setState(() {
      // ignore: curly_braces_in_flow_control_structures
      if (token != null)
        [
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Home()));
          })
        ];
      else
        [
          //iii=1,
          if(iii == 0){
            SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginDemo()));
                iii=1;
                print(iii);
          })
          }
          
        ];
      print(token);
    });
    // ignore: unnecessary_null_comparison
  }*/

  var data = [];
  String token = '';

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Login Page",
          textAlign: TextAlign.center,
        )),
        backgroundColor: Color(0xff003049),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    //width: 200,
                    //height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset(
                  'assets/logo.png',
                  width: 215,
                )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10, bottom: 50),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Color(0xff003049), fontSize: 15),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xff003049),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  loginUser(email, password);
                  print(data);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Home()));
                  /*if (isValidEmail(email)) {
                    
                    
                    print(email);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Home()));
                  } else {
                    
                    print('heyyy');
                    print(email);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Reset Your Email Please"),
                          content: Text("An error has occurred"),
                        );
                      },
                    );
                  }*/

                  /*Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Home();
                  }))*/
                  ;
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  Column(
                // children: data.map(((e) {
                //   return Text(e);
                //  })).toList()),
                Text('New User?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => newaccount()));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Color(0xff003049)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 255,
                    right: 0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loginUser(email, password) async {
    final Uri url = Uri.parse('http://127.0.0.1:8000/api/users/login/');
    final bodyy = jsonEncode({'username': email, 'password': password});
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: bodyy);
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var bodyyy = json.decode(response.body);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', bodyyy["token"]);

    //print(token);
    setState(() {});
  }
}

bool isValidEmail(String email) {
  //Email validation expression
  final emailRegEx = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailRegEx.hasMatch(email);
}

