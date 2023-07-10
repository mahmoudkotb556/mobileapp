import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/NOTE/UPDATE.dart';

import 'add_note.dart';

class NotesScreen extends StatefulWidget {
   NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> note=["wake 7","woke8","woke9"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        addnote();

      },child:Icon(Icons.add),),
    body:ListView.builder(itemCount: note.length,
      itemBuilder: (context, index) {
      return Noteitem(index);
    },),

    );
  }

 Widget Noteitem(int index){
    return         Container(margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.grey[300],borderRadius:BorderRadius.circular(20)),child:
      Row(children: [
         Expanded(child: Text(note[index])),
        IconButton(onPressed: (){
        upadate(index);
          setState(() {

          });
        }, icon: Icon(Icons.edit,color: Colors.green,)),
        IconButton(onPressed:() {
          note.removeAt(index);
          setState(() {

          });
        }, icon: Icon(Icons.delete,color: Colors.red,))
      ],),

    );

 }
 void addnote(){


    Navigator.push(context,
    MaterialPageRoute(builder: (context)=> AddnoteScreen(),)
    ).then((value){
      if (value== null)
        return
      note.add(value);
      setState(() {

      });
    });
 }

  void upadate(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>UPDATENOTE(note: note[index],))).then((value) {
      if (value== null){
        return;
      }
      note[index]=value;
      setState(() {

      });
    });
  }
}