import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  
  final  Widget? child;
  Logo({this.child});

  @override
  Widget build(BuildContext context) {
   
    return Center(
      child:Column(
        children:[
        SizedBox(
          height:50,
        ),
        Image.asset(
          "assets/logo.png",
          width:115,
          ),
        child ?? SizedBox(),

      ],
      ),
    );
  }
}