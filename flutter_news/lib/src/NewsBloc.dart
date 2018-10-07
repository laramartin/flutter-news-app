import 'dart:async';
import 'dart:collection';

import 'package:flutter_news/src/article.dart';
import 'package:flutter_news/src/json_parser.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  Stream<List<Article>> get articles => _articlesSubject.stream;

  var _articles = <Article>[];

  NewsBloc() {
    _updateArticles().then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  List<int> _ids = [
    18120667,
    18123282,
    18122847,
    18122824,
    18123058,
    18110372,
    18123587,
    18122442,
    18120519,
    18113803,
  ];

  Future<Null> _updateArticles() async {
    final response = _ids.map((id) => _getArticle(id)).toList();
    List<Article> articles = await Future.wait(response);
    _articles = articles;
  }

  Future<Article> _getArticle(int id) async {
    final url = "https://hacker-news.firebaseio.com/v0/item/$id.json";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseArticle(response.body);
    }
    return null;
  }
}
