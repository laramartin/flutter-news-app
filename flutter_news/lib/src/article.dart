class Article {
  final String text;
  final String url;
  final String by;
  final int time;
  final int score;

  const Article({this.text,
    this.url,
    this.by,
    this.time,
    this.score});

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Article(
        text: json['text'] ?? 'null',
        url: json['url'] ?? 'null',
        by: json['by'],
        time: json['time'] ?? 0,
        score: json['score'] ?? 0,
    );
  }
}

final articles = [
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
  new Article(
      text: "this is a sample text",
      url: "www.google.com",
      by: "me",
      time: 1210981217,
      score: 1,
  ),
];
