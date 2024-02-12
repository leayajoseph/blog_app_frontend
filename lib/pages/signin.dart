import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String email="",pass="";
  TextEditingController ob1=new TextEditingController();
  TextEditingController ob2=new TextEditingController();
  void sendValues() async{
    email=ob1.text;
    pass=ob2.text;
    print("email: "+email+"\npassword: "+pass);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              controller: ob1,
              decoration: InputDecoration(
                labelText: "Enter email",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: ob2,
              decoration: InputDecoration(
                  labelText: "Enter password",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: sendValues, child: Text("Login")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {

            }, child: Text("New user")),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
