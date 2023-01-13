import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/medicine.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/widgets/buttonprimary.dart';
import 'package:flutter_application_1/widgets/general_logo.dart';
import 'package:flutter_application_1/pages/illustrations.dart';
import 'package:flutter_application_1/widgets/pagefirst.dart';
import 'package:flutter_application_1/pages/medicine_add.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/Microcard.dart';

class AddMed extends StatefulWidget {
  //const AddMed ({super.key});
  //String searchString = "";
  @override
  State<AddMed> createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  int _currentIndex=2;
  var selecteditem = null;
  List<String> names=[];
  List<String> des=[];
  List<int> ids=[];
  List<int> idshapes=[];
  var data=[];
  int value=7;
  var token;
  @override
   void initState() {
    getData();
    super.initState();
  }

  _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(token);
  }

  getData()async
  {
    await _checkToken();
    await getPills();
  }
  
  /*static List<MedicineModel> main_med_list=[MedicineModel('paracetamol', '1 pill', 'after breakfeast '),
  MedicineModel('gripex', '1 sachets', 'before sleep '),
  MedicineModel('insuline', '10 mg', 'after launch '),
  MedicineModel('Statin', '3 pill', '3 times a week '),
  MedicineModel('hair lotion', 'tiny amount', 'day and night')];
  List<MedicineModel> displaylist= List.from(main_med_list);
  void updateList(String value){

  }*/
  Widget build(BuildContext context) {
    return PageFirstLayout(
        appBarTitle: "My Pills",
        appBarRight: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return Med_add();
              }),
            );
          },
        ),
        topChild: Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 15),
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                //disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: ["gripex", "insuline", "Statin", 'paracetamol'],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "search",
                  //hintText: "country in menu mode",
                ),
              ),
            )

            /*TextField(
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
            ),*/
            ),
        containerChild: Container(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          child: Wrap(
            children: [
              Column(
              children: data.map(((e) {
                ids.add(e["id"]);
                des.add(e["description"]);
                idshapes.add(e["id_Shape"]);
                names.add(e["name"]);
                return Text("");
              })).toList(),
            )
            ,Column(
              children: [
                if (value == 0) ...[
                  Center(child: Text("no reminders today")),
                ] else ...[
                  for (int i = 0; i < ids.length; i++)
                    MicroCard(
                      id: ids[i],
                      idshape: idshapes[i],
                      name: names[i],
                      description: des[i],
                    ),
                ],
                 ],
            ),
            ],
          ),


        )
        /*children: [
          SizedBox(height:20.0),
          Expanded(child: ListView.builder(
            itemCount:displaylist.length ,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.all(8.0),
              title: Text('displaylist[index].name!', style:TextStyle(
                color:Colors.black,
                fontWeight: FontWeight.bold,

              ),
              ),
              subtitle: Text('${displaylist[index].dose}',
              style:TextStyle( color:Colors.black,
              )),

            ),
          ),)
        ],*/

        );
  }

 getPills() async {
  
  final Uri url = Uri.parse('http://127.0.0.1:8000/api/pills');
  final response = await http.get(
    url,
    headers: {'Content-type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
},
  );
  var body=json.decode(response.body);
  setState(() {
     data=body;
  });

}


}
