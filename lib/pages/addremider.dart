import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/theme.dart';

class AddRemider extends StatefulWidget {
  //const AddRemider({super.key});

  @override
  State<AddRemider> createState() => _AddRemiderState();
}

class _AddRemiderState extends State<AddRemider> {
  @override
  Widget build(BuildContext context) {
    return PageFirstLayout(
      appBarTitle: "Add Reminder",
      color: MyColors.Landing1,
      appBarRight: IconButton(
        icon: Icon(Icons.check),
        onPressed: (){
          /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return (AddRemider());},
      ),
          );*/
          }
    ),
    containerChild: Column(
      children: [
        SizedBox(height:10,),
        TextField(controller: TextEditingController()..text = '0',
                       onChanged: (text) => {},
                       decoration:InputDecoration(
                       
                       //suffixText: 'pills',
                       //s/uffixStyle:TextStyle( color:Colors.black,),
                      //filled:true,
                      //fillColor: Color.fromARGB(255, 197, 223, 221),
                      //hintText:'type dose',
                      labelText: 'Select Pill',
                      labelStyle: TextStyle(
                        color:Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                      ),
                      floatingLabelBehavior:FloatingLabelBehavior.auto,
                      

                       enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            width: 3, color:Color.fromARGB(255, 226, 181, 169),
                       )
                      ),
                    ),
                ),

        

      ],
    ),
    );
    
      //openTimePicker(context);
    
  }
   /*Future<void>  _openTimePicker(BuildContext context) async{
     showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      ).then((selectedTime) async {
        int hour = selectedTime!.hour;
        int minute = selectedTime.minute;
        print(selectedTime);
      });
  }*/

}