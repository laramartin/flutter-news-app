import 'package:flutter/material.dart';
import 'package:flutter_news/article.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final padding = 16.0;

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
      padding: EdgeInsets.all(padding),
      child: ListTile(
        title: Text(article.text),
        subtitle: Text(article.domain),
        selected: false,
        onTap: () async {
          var url = "http://${article.domain}";
          if (await canLaunch(url)) {
            launch(url);
          }
        },
      ),
    );
  }
}
