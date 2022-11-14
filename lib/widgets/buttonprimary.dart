import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home.dart';

class ButtonPrimary extends StatelessWidget {
    //const ButtonPrimary({super.key});
    //final  VoidCallback? onTap;
    //ButtonPrimary (  {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width - 100 ,
      height: 50 ,
      child:ElevatedButton(
        onPressed:()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home())),
         child:Text("GET STARTED"),
         style:ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 102, 138, 174),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
      
    );
  }
}

