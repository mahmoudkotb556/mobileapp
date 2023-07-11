import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'NOTES_SCREEN.dart';
import 'REGISTERSCREEN.dart';
import 'forgetpassword.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final email=TextEditingController();
  final PASSWOED=TextEditingController();
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.cyan,
      ),
      body:

      Container(

        child: SizedBox(width: double.infinity,child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const SizedBox(height:20 ,),
            TextFormField(
              controller: email,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance:Brightness.dark ,

              decoration:const InputDecoration(
                labelText: 'Email',

                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            const SizedBox(height:20 ,),
            TextFormField(controller: PASSWOED,
              obscureText: true,


              decoration: InputDecoration(
                labelText: 'password',

                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(width: double.infinity,child: ElevatedButton(onPressed: ()=>LOGIN(), child:const Text("LOGIN"),style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.cyan),
            ), )),
            const SizedBox(height: 15,),
            Container(width: double.infinity,child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
            }, child:const Text("REGISTER"),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.cyan)
              ),),),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>forgetScreen()));
            },
              child: Text("Forget Passwoed",style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontSize: 20,
                
              ),),
            )





          ],
          ),
        )),
      ),
    );
  }

  LOGIN() {
    String emaiLL=email.text;
    String pass=PASSWOED.text;
    auth.signInWithEmailAndPassword(email: emaiLL, password: pass).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotesScreen(),)
      );
    }).catchError((error){print(error);});
  }
}