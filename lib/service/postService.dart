import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApiService
{
  Future<dynamic> addPost(
      String userid,String post
      )async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.29.217:3001/api/post/addpost");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type":"application/json ; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "userId":userid,
      "post":post
    }));
    if(response.statusCode==200)
      {
        jsonDecode(response.body);
      }
    else
      {
        throw Exception("Failed");
      }
  }
}