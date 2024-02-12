import 'package:blog_app/pages/add_post.dart';
import 'package:blog_app/pages/view_post.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Blog App",
          style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPost()));
                  }, child: Text("Add Post")),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>ViewPost()));
                  }, child: Text("View Post")),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
