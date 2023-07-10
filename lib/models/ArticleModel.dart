// class ArticleModel {
//   String author;
//   String title;
//   String description;
//   String url;
//   String content;
//   DateTime publishedAt;
//   ArticleModel(this.author, this.title, this.description, this.content,
//       this.url, this.publishedAt);

//   get urlToImage => null;
// }
class ArticleModel {
  // String author;
  String title;
  String description;
  String url;
  String urlToImage; // Add this property
  String? content;
  // DateTime publishedAt;

  ArticleModel({
    // required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    // required this.publishedAt,
  });
}

