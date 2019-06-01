import 'package:flutter/foundation.dart';
import 'package:flutter_bot/models/post_model.dart';
import 'package:flutter_bot/repositories/post_repository.dart';

class PostBloc extends ChangeNotifier {
  PostRepository _repo = PostRepository();

  List<Post> _list = List();



  List<Post> get allPosts => _list;


  getPosts() async {
    PostResult _result = await _repo.getPosts();
    _list = _result.results;
    notifyListeners();
  }


}


