import 'dart:convert';

import 'package:http/http.dart' as http;

class postApi {
  static registerUser(String title, String desc) async {
    await http.post("http://0.0.0.0:8000/api/add_post",
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "title": title,
          "desc": desc,
        }));

    // return response.data;
  }
}
