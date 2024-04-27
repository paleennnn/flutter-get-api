import 'dart:convert';

ResponseArticles responseArticlesFromJson(String str) =>
    ResponseArticles.fromJson(json.decode(str));

String responseArticlesToJson(ResponseArticles data) =>
    json.encode(data.toJson());

class ResponseArticles {
  final String status;
  final int totalResult;
  final List<Article> articles;

  ResponseArticles({
    required this.status,
    required this.totalResult,
    required this.articles,
  });

  factory ResponseArticles.fromJson(Map<String, dynamic> json) {
    return ResponseArticles(
      status: json["status"] ?? "", // default value for status if it's null
      totalResult: json["totalResult"] ?? 0, // default value for totalResult if it's null
      articles: (json["articles"] as List<dynamic>?)
          ?.map((x) => Article.fromJson(x))
          .toList() ?? [],
    );
}

Map<String, dynamic> toJson() => {
  "status": status,
  "totalResult": totalResult,
  "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
};

}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "Tidak ada Author",
        title: json["title"] ?? "Tidak ada Title",
        description: json["description"] ?? "Tidak ada description",
        url: json["url"] ?? "Tidak ada url",
        urlToImage: json["urlToImage"] ??
            "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg",
        publishedAt: DateTime.tryParse(json["publishedAt"]) ?? DateTime(2023, 11, 20),
        content: json["content"] ?? "Tidak ada content",
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
