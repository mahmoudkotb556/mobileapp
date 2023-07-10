import 'package:flutter/material.dart';

import 'NOTES_SCREEN.dart';

class UPDATENOTE extends StatefulWidget {
  const UPDATENOTE ({super.key, required this.note});
 final String note;

  @override
  State<UPDATENOTE> createState() => _UPDATENOTEState();
}

class _UPDATENOTEState extends State<UPDATENOTE> {
  final notecontroller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notecontroller.text=widget.note;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  title: Text("UPDATE"),),
body:  Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Column(children: [

    Container(width: double.infinity,child: TextFormField(

    controller: notecontroller,decoration: InputDecoration(
        labelText: "note",
        border: OutlineInputBorder(),
      ),

    )),
SizedBox(height: 10,),
    Container(width: double.infinity,
      child: ElevatedButton(onPressed: (){
        addnotee();



      }, child: Text("UPDATE")),
    )









  ],),
),

    );
  }

  void addnotee() {
    String notee=notecontroller.text;
    Navigator.pop(context,notee);
  }
}
