import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/theme.dart';
class Med_add extends StatelessWidget {
  const Med_add({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFirstLayout(
      appBarTitle: "Add Pill",
      appBarRight: IconButton(icon: Icon(Icons.check),
      onPressed: (){},),
      topChild: Container(
        margin: EdgeInsets.fromLTRB(30,0,30,15),
        child:TextField(
          decoration:InputDecoration(
            filled:true,
            fillColor:Colors.white,
            hintText:'Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
           )
            ),
          ),
          
        ),
        containerChild:Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      )

        
      );
    
  }
}