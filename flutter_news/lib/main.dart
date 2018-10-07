import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/NewsBloc.dart';
import 'package:flutter_news/src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  final newsBloc = NewsBloc();
  runApp(MyApp(bloc: newsBloc));
}

class MyApp extends StatelessWidget {
  final NewsBloc bloc;

  MyApp({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        bloc: bloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final NewsBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) => ListView(
              children: snapshot.data.map(_buildItem).toList(),
            ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ExpansionTile(
        title: Text(article.title),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(article.type),
              IconButton(
                icon: Icon(Icons.open_in_browser),
                onPressed: () async {
                  final url = article.url;
                  if (url != null) {
                    if (await canLaunch(url)) {
                      launch(url);
                    }
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
