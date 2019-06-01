
import 'dart:convert';

import 'package:http/http.dart' as http;

class registerApi{


  static  registerUser(String name,String email,String password) async{

    var response= await http.post("http://0.0.0.0:8000/api/register_user",headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
    },
        body: json.encode({

          "name": name,
          "email":email,
          "password":password
        })
    );
    return    response.body;


    // return response.data;

  }



}