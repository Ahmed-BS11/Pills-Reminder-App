import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Illustration extends StatelessWidget {
  //const Illustration({super.key});
  //final Widget child;
  //Illustration(this.child);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Image.asset('assets/landing1.png',
        width:150,),
        Image.asset('assets/landing3.png',
        width:150,),
        ],),
        SizedBox(height:40.0,),
        Text("your medication reminder is here",
        style:GoogleFonts.lato(textStyle:TextStyle(
        color:Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,

        ),
        ),
        ),
        Text(" To never forget a Med again , +Med health  fullfils all your medication needs in one place .",
        style:GoogleFonts.lato(textStyle:TextStyle(
          color:Color.fromARGB(255, 132, 132, 132),
          letterSpacing: .3,
          fontSize: 18,
          
          ),
        ),
        ),
        SizedBox(
          height:40.0,
        ),
        //child ?? SizedBox(height:40.0),
      ],
    );
  }
}