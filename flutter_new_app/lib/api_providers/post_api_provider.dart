
import 'package:dio/dio.dart';
import 'package:flutter_bot/global/global.dart';
import 'dart:async';

import 'package:flutter_bot/models/post_model.dart';
import 'package:flutter_bot/models/single_post_model.dart';



class ContactApiProvider {

  final Dio _dios = Dio();


  //gettinh post data
  Future<PostResult> getPosts() async {
    try {
      Response response = await _dios.get(URL_POST);
      return PostResult.fromJson(response.data);
    } catch (e) {
      return PostResult.withError(e.toString());
    }
  }


  //getting single post data

  Future<PostResultsingle> getSinglePost(String id) async {
    try {
      Response response = await _dios.get(SINGLE_POST_URL+id);
      return PostResultsingle.fromJson(response.data);
    } catch (e) {
      return PostResultsingle.withError(e.toString());
    }
  }
}



