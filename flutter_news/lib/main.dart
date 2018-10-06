import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/json_parser.dart';
import 'package:flutter_news/src/article.dart';
import 'package:http/http.dart' as http;
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
  final padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids
            .map(
              (i) => FutureBuilder<Article>(
                    future: _getArticle(i),
                    builder: (BuildContext context,
                        AsyncSnapshot<Article> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Text(snapshot.data.title);
                      } else {
                        return Text("something failed");
                      }
                    },
                  ),
            )
            .toList(),
      ),
    );
  }

  Future<Article> _getArticle(int id) async {
    final url = "https://hacker-news.firebaseio.com/v0/item/$id.json";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final article = parseArticle(response.body);
      return article;
    }
    return null;
  }

  Widget _buildItem(Article article) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ExpansionTile(
        title: Text(article.text),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("by ${article.by}"),
              IconButton(
                icon: Icon(Icons.open_in_browser),
                onPressed: () async {
                  var url = "http://${article.url}";
                  if (await canLaunch(url)) {
                    launch(url);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
