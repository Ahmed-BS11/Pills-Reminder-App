import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/buttonprimary.dart';
import 'package:flutter_application_1/widgets/general_logo.dart';
import 'package:flutter_application_1/pages/illustrations.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/pages/medicine_add.dart';
class AddMed extends StatefulWidget {
  //const AddMed ({super.key});
   //String searchString = "";
  @override
  State<AddMed> createState() => _AddMedState();
}
class _AddMedState extends State<AddMed> {
  Widget build(BuildContext context) {
    return PageFirstLayout(
      appBarTitle: "My Pills",
      appBarRight: IconButton(
        icon: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Med_add();
                      }
                      ),
          );      
          
        },
      ),
      topChild: Container(
        margin: EdgeInsets.fromLTRB(30,0,30,15),
        child: TextField(
          onChanged: (value) {
            setState((){
              var searchString = value;
            });

          },
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            hintText: 'Search',
            fillColor: Colors.white,
            focusColor: Theme.of(context).primaryColor,
            filled: true,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      containerChild:Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      )
      
     
    );
  } 
    
  
}