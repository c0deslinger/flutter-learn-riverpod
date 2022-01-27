class HomeResponse {
  HomeResponse({
    this.posts,
  });

  Posts? posts;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        posts: Posts.fromJson(json["posts"]),
      );

  Map<String, dynamic> toJson() => {
        "posts": posts?.toJson(),
      };
}

class Posts {
  Posts({
    this.data,
  });

  List<Datum>? data;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
  });

  String? id;
  String? title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
