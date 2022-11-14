import'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/buttonprimary.dart';
import 'package:flutter_application_1/widgets/general_logo.dart';
import 'package:flutter_application_1/widgets/illustrations.dart';
import 'package:flutter_application_1/widgets/home.dart';
class FirstScreen extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Logo(
        child:Column(children : [
          SizedBox(
            height:45,
            ),
            Illustration(
            ),
            SizedBox(height:40.0),
            ButtonPrimary(
              //onTap:(
                //{
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()))
                //}
              //)
            ),
        ],
        )
      ),
      
    );
  }
}