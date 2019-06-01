class Commment {
  final int  id;
  final String username;
  final String title;
  final String comment;
  final String time;
  
  Commment({this.id,this.username,this.title,this.comment,this.time});
  Commment.fromJson(Map<String, dynamic> json)
      : id = json["post_id"],
        username = json['user_name'],
        title = json['title'],
        comment = json['comment'],
        time = json['time'];
       

}

class CommentResult {
  List<Commment> results;
  final String error;

  CommentResult(this.results, this.error);
  CommentResult.fromJson(Map<String, dynamic> json)
      : results = (json["comments"] as List)
            .map((i) => new Commment.fromJson(i))
            .toList(),
        error = "";

  CommentResult.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
