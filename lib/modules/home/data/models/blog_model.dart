class BlogModel {
  String id;
  String type;
  String title;
  String desc;
  String imgUrl;
  int likes;
  int timeStamp;
  String author;
  int readTime;
  List<Content> content;

  BlogModel(
      {this.id,
        this.type,
        this.title,
        this.desc,
        this.imgUrl,
        this.likes,
        this.timeStamp,
        this.author,
        this.readTime,
        this.content});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    desc = json['desc'];
    imgUrl = json['imgUrl'];
    likes = json['likes'];
    timeStamp = json['timeStamp'];
    author = json['author'];
    readTime = json['readTime'];
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['imgUrl'] = this.imgUrl;
    data['likes'] = this.likes;
    data['timeStamp'] = this.timeStamp;
    data['author'] = this.author;
    data['readTime'] = this.readTime;
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String type;
  String data;

  Content({this.type, this.data});

  Content.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}
