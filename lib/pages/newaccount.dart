import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/widgets/customcard.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/datecard.dart';
import 'package:flutter_application_1/pages/addmed.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/forgotpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class newaccount extends StatefulWidget {
  //const newaccount({super.key});

  @override
  State<newaccount> createState() => newaccountState();
}

class newaccountState extends State<newaccount> {
  
  String email = "";
  String password = "";
  String name = "";
  String last_name = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Create an Account",
          textAlign: TextAlign.center,
        )),
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.LapisLazuli,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/logo.png')),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new TextField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'First Name',
                          hintText: 'Enter your First Name '),
                    ),
                  ),
                ),
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new TextField(
                      onChanged: (value) {
                        setState(() {
                          last_name = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Last Name',
                          hintText: 'Enter your Last Name '),
                    ),
                  ),
                ),
              ],
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: MyColors.LapisLazuli,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  RegisterUser(name, last_name, email, password);

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Home()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void RegisterUser(name, last_name, email, password) async {
    final Uri url = Uri.parse('http://127.0.0.1:8000/api/users/register/');
    print(name);
    final bodyy = jsonEncode({
      'name': name,
      'last_name': last_name,
      'email': email,
      'password': password
    });

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: bodyy);
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var boody = json.decode(response.body);
    //var bodyyy = json.decode(response.body);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', boody["token"]);
  }
}
 

      /*Container(
        child: ElevatedButton(child: Text("Retourner"),onPressed: () => {
          Navigator.pop(context)
        },),*/
