import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailcontroller=TextEditingController();
  final password=TextEditingController();
final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [

          Container(
            margin: EdgeInsets.only(top: 20,right: 20,left: 20) ,
            child: TextFormField(
              controller: emailcontroller,
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
          ),

          Container(
            margin: EdgeInsets.only(top: 10,right: 20,left: 20) ,
            child: TextFormField(
              controller:password,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance:Brightness.dark ,
              obscureText: true,

              decoration:const InputDecoration(
                labelText: 'password',

                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
          ),


          SizedBox(height: 20,),
          SizedBox(width: double.infinity,
            child: ElevatedButton(onPressed: ()=> register(), child: Text("Register"),style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.cyan)
            ),),
          ),SizedBox(width: 10,),


        ],


        ),
      ),
    );
  }

  register() {
    String email=emailcontroller.text;
    String passwordd=password.text;
    auth.createUserWithEmailAndPassword(email: email, password: passwordd)
    .then((value){
      Navigator.pop(context);
    }).catchError((error){
      print(error);
    });
  }
}