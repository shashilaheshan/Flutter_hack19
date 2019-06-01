class SinglePost {
  final int id;

  final String title;
  final String description;
  final String time;
  final String image_url;
  final String username;

  final String category;

  SinglePost(
      {
        this.id,
      this.username,
      this.title,
      this.description,
      this.time,
      this.image_url,
      this.category});

  SinglePost.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json['username'],
        title = json['title'],
        description = json['description'],
        time = json['time'],
        image_url = json['im_url'],
        category = json['cat_name'];
}

class PostResultsingle {
  List<SinglePost> results;
  final String error;

  PostResultsingle(this.results, this.error);
  PostResultsingle.fromJson(Map<String, dynamic> json)
      : results = (json["posts"] as List)
            .map((i) => new SinglePost.fromJson(i))
            .toList(),
        error = "";

  PostResultsingle.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
