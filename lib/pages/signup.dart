import 'package:blog_app/service/signupService.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name="",age="",ph="",add="",pin="",email="",pass="";
  TextEditingController ob1=new TextEditingController();
  TextEditingController ob2=new TextEditingController();
  TextEditingController ob3=new TextEditingController();
  TextEditingController ob4=new TextEditingController();
  TextEditingController ob5=new TextEditingController();
  TextEditingController ob6=new TextEditingController();
  TextEditingController ob7=new TextEditingController();
  void sendValues() async{
    name=ob1.text;
    age=ob2.text;
    ph=ob3.text;
    add=ob4.text;
    pin=ob5.text;
    email=ob6.text;
    pass=ob7.text;
    print("name: "+name+
    "\nage: "+age+
    "\nphone: "+ph+
        "\naddress: "+add+
        "\npin code: "+pin+
        "\nemail: "+email+
        "\npassword: "+pass);

    final response=await SignupServiceApi().sendData(name, age, ph, add, pin, email, pass);
    if(response["status"]=="success")
      {
        print("successfully added");
      }
    else
      {
        print("failed");
      }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                TextField(
                  controller: ob1,
                  decoration: InputDecoration(
                    labelText: "Enter name",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ob2,
                  decoration: InputDecoration(
                    labelText: "Enter age",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ob3,
                  decoration: InputDecoration(
                    labelText: "enter mobile",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ob4,
                  decoration: InputDecoration(
                    labelText: "enter address",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ob5,
                  decoration: InputDecoration(
                    labelText: "enter pincode",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ob6,
                  decoration: InputDecoration(
                      labelText: "enter email",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ob7,
                  decoration: InputDecoration(
                      labelText: "enter password",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: sendValues, child: Text("Signup")),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: ()
                {
                  Navigator.pop(context);
                }, child: Text("back to login")),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
