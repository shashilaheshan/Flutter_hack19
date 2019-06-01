import 'package:flutter/foundation.dart';
import 'package:flutter_bot/models/single_post_model.dart';
import 'package:flutter_bot/repositories/post_repository.dart';


class singlePostBloc extends ChangeNotifier{

  PostRepository _repo = PostRepository();

  List<SinglePost> _list = List();



  List<SinglePost> get allPosts => _list;


  getSinglePost(String id) async {
    PostResultsingle _result = await _repo.getSinglePost(id);
    _list = _result.results;
    notifyListeners();
  }


}


