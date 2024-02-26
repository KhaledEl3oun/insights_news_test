import 'source.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  dynamic content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json['source'] == null
            ? null
            : Source.fromJson(Map<String, dynamic>.from(json['source'])),
        author: json['author']?.toString(),
        title: json['title']?.toString(),
        description: json['description'],
        url: json['url']?.toString(),
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt']?.toString(),
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        if (source != null) 'source': source?.toJson(),
        if (author != null) 'author': author,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (url != null) 'url': url,
        if (urlToImage != null) 'urlToImage': urlToImage,
        if (publishedAt != null) 'publishedAt': publishedAt,
        if (content != null) 'content': content,
      };
}
