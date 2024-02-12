import 'package:blog_app/service/postService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController ob1=new TextEditingController();

  void sendPostData() async{
    SharedPreferences prefer=await SharedPreferences.getInstance();
    String userId=prefer.getString("userId")??"";
    final response=await PostApiService().addPost(userId, ob1.text);
    if(response["status"]=="success")
      {
        print("post added successfully");
      }
    else
      {
        print("Error");
      }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Add Post",
          style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: ob1,
                decoration: InputDecoration(
                  labelText: "Enter post",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: sendPostData, child: Text("add")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()
                  {
                    Navigator.pop(context);
                  }, child: Text("back"))
            ],
          ),
        ),
      ),
    );
  }
}
