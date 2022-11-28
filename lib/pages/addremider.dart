import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddRemider extends StatefulWidget {
  //const AddRemider({super.key});

  @override
  State<AddRemider> createState() => _AddRemiderState();
}

class _AddRemiderState extends State<AddRemider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //openTimePicker(context);
    );
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