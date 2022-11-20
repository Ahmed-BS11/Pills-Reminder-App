import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';

class ButtonPrimary extends StatelessWidget {
    //const ButtonPrimary({super.key});
    //final  VoidCallback? onTap;
    //ButtonPrimary (  {this.onTap});
    final  String   text ;
    ButtonPrimary({ required this.text}); 
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width - 100 ,
      height: 50 ,
      child:ElevatedButton(
        onPressed:()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginDemo())),
         child:Text(text),
         style:ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 102, 138, 174),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
      
    );
  }
}

