import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {

  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  bool get deleted;

  String get type;

  String get by;

  int get time;

  String get text;

  bool get dead;

  String get parent;

  String get poll;

  BuiltList<int> get kids;

  String get url;

  int get score;

  String get title;

  BuiltList<int> get parts;

  int get descendants;

  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}
