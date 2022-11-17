
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/curved.dart';
import 'package:flutter_application_1/widgets/first.dart';
import 'package:flutter_application_1/theme.dart';

class PageFirstLayout extends StatelessWidget {
  PageFirstLayout(
      {
        
        this.appBarTitle ='',
        this.appBarRight = const SizedBox(height: 0, width: 0),
        this.color = MyColors.Landing2,
        this.topChild =  const SizedBox(height: 0, width: 0) ,
        this.containerChild = const SizedBox(height: 0, width: 0) ,
      });

  final Widget topChild;
  final Widget containerChild;
  final Widget appBarRight;
  final String appBarTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        leading: IconButton(icon: Icon(
          Icons.arrow_back
        ),
        onPressed: (){
          Navigator.pop( context );
        },
        ),
        
        toolbarHeight: 80,
        titleSpacing: 30,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.6
          ),
        ),
        actions: [
          appBarRight
        ],
        elevation: 0.0,
        backgroundColor: color,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body:
      Column(
        children: [
        topChild,
        CurvedContainer(
            containerChild
      ),
        ],
      
    ),
    );
  }
 
}