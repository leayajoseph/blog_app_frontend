import 'dart:convert';

import 'package:http/http.dart' as http;

class SignupServiceApi
{
  Future<dynamic> sendData(
      String name,String age,String ph,String add,String pin,String email,String pass
      ) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://172.16.185.178:3001/api/signup/add");
    var response=await client.post(apiUrl,
    headers: <String,String>
    {
      "Content-Type":"application/json ; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "name":name,
      "age":age,
      "mobile":ph,
      "address":add,
      "pincode":pin,
      "email":email,
      "password":pass
    }));
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception("failed");
      }
    
  }
  Future<dynamic> sendLogin(
      String email,String pass
      )async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://172.16.185.178:3001/api/signup/login");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type":"application/json ; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "email":email,
      "password":pass
    }));
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception("Failed");
      }
  }
}