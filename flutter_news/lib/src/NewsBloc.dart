import 'dart:async';
import 'dart:collection';

import 'package:flutter_news/src/article.dart';
import 'package:flutter_news/src/json_parser.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

enum StoriesType { topStories, newStories }

class NewsBloc {

  Stream<List<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;
  final _storiesTypeController = StreamController<StoriesType>();

  Stream<bool> get isLoading => _isLoadingSubject.stream;
  final _isLoadingSubject = BehaviorSubject<bool>(seedValue: false);

  var _articles = <Article>[];

  NewsBloc() {
    _getArticles(_topStoriesIds);

    _storiesTypeController.stream.listen((storiesType) {
      switch (storiesType) {
        case StoriesType.newStories:
          _getArticles(_newStoriesIds);
          break;
        case StoriesType.topStories:
          _getArticles(_topStoriesIds);
          break;
      }
    });
  }

  void _getArticles(List<int> ids) {
    _isLoadingSubject.add(true);
    _updateArticles(ids).then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
      _isLoadingSubject.add(false);
    });
  }

  static List<int> _newStoriesIds = [
    18120667,
    18123282,
    18122847,
    18122824,
    18123058,
  ];

  static List<int> _topStoriesIds = [
    18110372,
    18123587,
    18122442,
    18120519,
    18113803,
  ];

  Future<Null> _updateArticles(List<int> ids) async {
    final response = ids.map((id) => _getArticle(id)).toList();
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
