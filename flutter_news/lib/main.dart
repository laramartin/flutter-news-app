import 'package:flutter/material.dart';
import 'package:flutter_news/Article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _articles.map(_buildItem).toList(),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(article.text),
        subtitle: Text(article.domain),
      ),
    );
  }
}
