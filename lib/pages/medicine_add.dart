import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/theme.dart';

  //const Med_add({super.key});


class Med_add extends StatefulWidget {
  //const Med_add({super.key});

  @override
  State<Med_add> createState() => _Med_addState();
}

class _Med_addState extends State<Med_add> {
   List<String> _icons = [
    'drug.png',
    'inhaler.png',
    'pill.png',
    'pill_rounded.png',
    'syringe.png',

  ];
   int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PageFirstLayout(
      appBarTitle: "Add Pill",
      appBarRight: IconButton(icon: Icon(Icons.check),
      onPressed: (){/*
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
          //padding:EdgeInsets.all(16),
          height:90,
          decoration: BoxDecoration(
            color: Color(0xFF83CBC8),
            borderRadius: BorderRadius.all(Radius.circular(20)),

          ),
          child:
          Center(
            child: Text("your med has been successfully added ",
            style:TextStyle(fontSize: 16,
            fontFamily: 'Raleway',)),
          ),
          
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black.withOpacity(0.0),
          //backgroundColor: Colors.transparent,
          ),
               
        );
        
      }*/
      final snackBar = SnackBar(
            backgroundColor: Color.fromARGB(255, 166, 223, 219),
            content: const Text('your med has been successfully added',style: TextStyle(color: Colors.black),),
            action: SnackBarAction(
              label: 'X',
              textColor: Colors.black,
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);}
      
      ),
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
               Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Shape',
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
              ),
            ),
              SizedBox(height: 10,),
               _buildShapesList(),//addlistofview
              SizedBox( height: 30),
               Container(
                child:TextField(
                       controller: TextEditingController()..text = '0',
                       onChanged: (text) => {},
                       decoration:InputDecoration(
                       
                       suffixText: 'pills',
                       suffixStyle:TextStyle( color:Colors.black,),
                      //filled:true,
                      //fillColor: Color.fromARGB(255, 197, 223, 221),
                      //hintText:'type dose',
                      labelText: 'Dose',
                      labelStyle: TextStyle(
                        color:Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                      ),
                      floatingLabelBehavior:FloatingLabelBehavior.auto,
                      

                       enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 3, color:  Color(0xFF76B0DE),
                       )
                      ),
                    ),
                ),

               
               ),
               SizedBox(height:50),
               Container(
                child:TextField(
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration:InputDecoration(
                      
                       //suffixText: 'pills',
                       //suffixStyle:TextStyle( color:Colors.black,),
                      //filled:true,
                      //fillColor: Color.fromARGB(255, 197, 223, 221),
                      //hintText:'type dose',
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color:Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                      ),
                      floatingLabelBehavior:FloatingLabelBehavior.auto,
                       //isDense: true,
                       //maxLines: 5,
                        //contentPadding: EdgeInsets.all(8),

                       enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 3, color:  Color(0xFF76B0DE),
                       )
                      ),
                    ),
                ),

               
               ),
               SizedBox(height:50),
               Container(
                child:TextField(
                    //maxLines: 3,
                    //keyboardType: TextInputType.multiline,
                    decoration:InputDecoration(
                      
                       suffixText: 'pills',
                       suffixStyle:TextStyle( color:Colors.black,),
                      //filled:true,
                      //fillColor: Color.fromARGB(255, 197, 223, 221),
                      //hintText:'type dose',
                      labelText: 'Refill on ',
                      labelStyle: TextStyle(
                        color:Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                      floatingLabelBehavior:FloatingLabelBehavior.auto,
                       //isDense: true,
                       //maxLines: 5,
                        //contentPadding: EdgeInsets.all(8),

                       enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 3, color:  Color(0xFF76B0DE),
                       )
                      ),
                    ),
                ),

               
               ),

                     //SizedBox( width: 10),  
            ]
            
          
             
          ),
        )
      
            
          );
        
        
  }
  Widget _buildShapesList() {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _icons
            .asMap()
            .entries
            .map((MapEntry map) => _buildIcons(map.key))
            .toList(),
      ),
    );
  }
   Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: (index == _selectedIndex)
              ? Theme.of(context).accentColor.withOpacity(.4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Image.asset('assets/' + _icons[index]),
      ),
    );
  }
 

}