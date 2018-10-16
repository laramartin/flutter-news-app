import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/NewsBloc.dart';
import 'package:flutter_news/src/article.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: LoadingInfo(widget.bloc.isLoading),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) => ListView(
              children: snapshot.data.map(_buildItem).toList(),
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Top stories"),
            icon: Icon(Icons.trending_up),
          ),
          BottomNavigationBarItem(
            title: Text("New stories"),
            icon: Icon(Icons.new_releases),
          )
        ],
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else if (index == 1) {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
          setState(() {
            _currentIndex = index;
          });
        },
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

class LoadingInfo extends StatefulWidget {
  Stream<bool> _isLoading;

  LoadingInfo(this._isLoading);

  @override
  LoadingInfoState createState() {
    return new LoadingInfoState();
  }
}

class LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._isLoading,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//        if (snapshot.hasData && snapshot.data) {
        _controller.forward().then((Null f) {
          _controller.reverse();
        });
        return FadeTransition(
          child: Icon(FontAwesomeIcons.hackerNewsSquare),
          opacity: Tween(begin: .5, end: 1.0).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeIn)),
        );
//        } else {
        return Container();
//        }
      },
    );
  }
}
