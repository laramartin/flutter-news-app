import 'package:flutter_news/src/article.dart';
import 'dart:convert' as parser;

List<int> parseTopStories(String json) {
  final parsed = parser.jsonDecode(json);
  return List<int>.from(parsed);
}

Article parseArticle(String json) {
  final parsed = parser.jsonDecode(json);
  return Article.fromJson(parsed);
}
