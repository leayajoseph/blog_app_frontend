import 'package:blog_app/models/postModel.dart';
import 'package:blog_app/service/postService.dart';
import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  Future<List<Posts>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PostApiService().getData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("View Post",
            style: TextStyle(color: Colors.white),),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot)
        {
          if(snapshot.hasData && snapshot.data!.isNotEmpty)
            {
              return ListView.builder(
                  itemCount:snapshot.data!.length,
                  itemBuilder: (context,index)
              {
                return Card(
                  child: ListTile(
                    title: Text("post: "+snapshot.data![index].post),
                    subtitle: Text("date: "+snapshot.data![index].postedDate.toString()),
                  ),
                );
              });
            }
          else
            {
              return Text("loading");
            }
        }),
      ),
    );
  }
}
