
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/NOTE/UPDATE.dart';

import 'LOGIN_SCREEN.dart';
import 'add_note.dart';

class NotesScreen extends StatefulWidget {
   NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final auth=FirebaseAuth.instance;
  final  firestore=FirebaseFirestore.instance;
 // List<String> note=[];
List<Map<String,dynamic>> notes=[];
@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    getdata();
  }
  void getdata(){
  firestore.collection("notes").get().then((value){
    notes.clear();
    final auth2=FirebaseAuth.instance;
    for(var docum in value.docs)
      { final note= docum.data();
        if (auth2.currentUser!.uid.toString()==note["uid"]){
        notes.add(note);}
      }
    print(notes);
setState(() { });
  }).catchError((error){print(error);});


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Notes"),
      actions: [
        IconButton(onPressed: (){
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>loginpage()));

        }, icon: Icon(Icons.exit_to_app))
      ],),
      floatingActionButton: FloatingActionButton(onPressed: (){

        addnote();

      },child:Icon(Icons.add),),
    body:ListView.builder(itemCount: notes.length,
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
         Expanded(child: Text(notes[index]['note'])),
        IconButton(onPressed: (){
        upadate(notes[index]);
          setState(() {

          });
        }, icon: Icon(Icons.edit,color: Colors.green,)),
        IconButton(onPressed:() {
          firestore.collection("notes").doc(notes[index]['noteid']).delete();
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

     getdata();
    });
 }

  void upadate(Map<String,dynamic> n) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>UPDATENOTE(notee: n,))).then((value) {

      getdata();

    });
  }
}