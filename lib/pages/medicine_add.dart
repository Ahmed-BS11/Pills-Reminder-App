import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/theme.dart';

  //const Med_add({super.key});


class Med_add extends StatelessWidget {
  

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
        containerChild:
        Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery. of(context). size. width / 20,0, MediaQuery. of(context). size. width / 20,0 ),
          child: Column(
            children:<Widget>[
              Container(
                child:Text('shape',textAlign:TextAlign.left,
                style:TextStyle(
                  fontSize:15,
                  fontFamily: 'Raleway',
                  color:Colors.black54,
                  fontWeight: FontWeight.w200,
                ),
                
                ),

              ),
              SizedBox(height: 10,),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Image.asset('assets/medicineBottle (1).png',
                            width:150,
                            height:150,),
                            Image.asset('assets/im1.png',
                            width:150,
                            height:150,),
                            Image.asset('assets/pill.png',
                            width:150,
                            height:150,),
                            Image.asset('assets/im4.jpg',
                            width:150,
                            height:150,)
                          ],
           )
          ),
              ),
               SizedBox( width: 10),
              Container(
                        child:Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                           children: [
                             Container(
                               child: TextField(
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
                          
                        ],)
                     //SizedBox( width: 10),
              
          
                )
               
            ]
            
          
             
          ),
        )
       


        
      );
    
  }
 
}