import 'dart:async';

import 'package:flutter_bot/api_providers/post_api_provider.dart';
import 'package:flutter_bot/models/post_model.dart';
import 'package:flutter_bot/models/single_post_model.dart';

class PostRepository {
  ContactApiProvider _obj = ContactApiProvider();

  Future<PostResult> getPosts() async {
    return _obj.getPosts();
  }

  Future<PostResultsingle> getSinglePost(String id) async {
    return _obj.getSinglePost(id);
  }
}
