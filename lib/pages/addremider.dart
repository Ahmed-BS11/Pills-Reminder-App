import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/theme.dart';

class AddRemider extends StatefulWidget {
  //const AddRemider({super.key});

  @override
  State<AddRemider> createState() => _AddRemiderState();
}

class _AddRemiderState extends State<AddRemider> {
  bool repeat = false;
  bool isEveryday = false;

  void _showTimepicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return PageFirstLayout(
      appBarTitle: "Add Reminder",
      color: MyColors.Landing1,
      appBarRight: IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return (AddRemider());},
      ),
          );*/
          }),
      containerChild: Column(children: [
        SizedBox(
          height: 10,
        ),
        TextField(
          //controller: TextEditingController()..text = '0',
          onChanged: (text) => {},
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 226, 181, 169), width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),

            //suffixText: 'pills',
            //s/uffixStyle:TextStyle( color:Colors.black,),
            //filled:true,
            //fillColor: Color.fromARGB(255, 197, 223, 221),
            //hintText:'type dose',
            labelText: 'Select Pill',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,

            /*enabledBorder: UnderlineInputBorder(
                        
                        //<-- SEE HERE
                        borderSide: BorderSide(
                           
                            width: 3,
                             color:Color.fromARGB(255, 226, 181, 169),
                       )
                      ),*/
          ),
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
                child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color.fromARGB(255, 226, 181, 169),
                    value: this.repeat,
                    title: Text("Repeat"),
                    onChanged: (bool? value) {
                      setState(() {
                        this.repeat = value ?? false;
                      });
                    })),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color.fromARGB(255, 226, 181, 169),
                  value: this.isEveryday,
                  title: Text("Everyday"),
                  onChanged: (bool? value) {
                    setState(() {
                      this.isEveryday = value ?? false;
                    });
                  }),
            ),
          ],
        ),
        SizedBox(height: 50),
        Wrap(
          runSpacing: 1,
          spacing: 6,
          children: [
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Sun')),
              onPressed: () {},
            ),
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Mon')),
              onPressed: () {},
            ),
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Tue')),
              onPressed: () {},
            ),
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Wed')),
              onPressed: () {},
            ),
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Thu')),
              onPressed: () {},
            ),
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Fri')),
              onPressed: () {},
            ),
            ActionChip(
              label: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 20,
                  ),
                  child: Text('Sat')),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 45,
        ),
        Center(
          child: MaterialButton(
            onPressed: _showTimepicker,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'PICK TIME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            color: Color.fromARGB(255, 226, 181, 169),
          ),
        )
      ]),
    );
    // ignore: dead_code
    

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
