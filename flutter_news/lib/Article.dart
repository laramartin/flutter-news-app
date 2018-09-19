class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;

  const Article({this.text,
    this.domain,
    this.by,
    this.age,
    this.score,
    this.commentsCount});
}

final articles = [
  new Article(
      text: "this is the first sample text",
      domain: "bla.com",
      by: "me",
      age: "30",
      score: 1,
      commentsCount: 2
  ),
  new Article(
      text: "this is a second sample text",
      domain: "bla.com",
      by: "me",
      age: "30",
      score: 1,
      commentsCount: 2
  ),
];
