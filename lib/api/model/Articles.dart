import 'Source.dart';

/// source : {"id":"the-verge","name":"The Verge"}
/// author : "Jay Peters"
/// title : "Three of the biggest Reddit communities now only feature John Oliver posts - The Verge"
/// description : "Three huge Reddit communities, r/pics, r/gifs, and r/aww, now only allow posts about comedian and Last Week Tonight host John Oliver after users voted for the change."
/// url : "https://www.theverge.com/2023/6/17/23764729/reddit-users-pics-gifs-subreddits-john-oliver"
/// urlToImage : "https://cdn.vox-cdn.com/thumbor/bl_AFB4gzci8IlkXEJIBnXBQIOY=/0x0:3000x2000/1200x628/filters:focal(1500x1000:1501x1001)/cdn.vox-cdn.com/uploads/chorus_asset/file/24734533/1247694057.jpg"
/// publishedAt : "2023-06-18T14:23:55Z"
/// content : "Three of the biggest Reddit communities reopened in the funniest way possible\r\nThree of the biggest Reddit communities reopened in the funniest way possible\r\n / All posts on r/pics, r/gifs, and r/aww… [+4808 chars]"

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
