class Post {
  final int  id;
  final String username;
  final String title;
  final String description;
  final String time;
  final String image_url;
  final String category;

  Post({this.id,this.username,this.title,this.description,this.time,this.image_url,this.category});

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json['username'],
        title = json['title'],
        description = json['description'],
        time = json['time'],
        image_url = json['image_url'],
        category = json['cat_name'];

}

class PostResult {
  List<Post> results;
  final String error;

  PostResult(this.results, this.error);
  PostResult.fromJson(Map<String, dynamic> json)
      : results = (json["posts"] as List)
            .map((i) => new Post.fromJson(i))
            .toList(),
        error = "";

  PostResult.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
