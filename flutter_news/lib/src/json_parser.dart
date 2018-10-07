import 'package:flutter_news/src/article.dart';
import 'dart:convert' as parser;
import 'package:flutter_news/src/serializers.dart';

List<int> parseTopStories(String json) {
  final parsed = parser.jsonDecode(json);
  return List<int>.from(parsed);
}

Article parseArticle(String json) {
  final parsed = parser.jsonDecode(json);
  return standardSerializers.deserializeWith(Article.serializer, parsed);
}
