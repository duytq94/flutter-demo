import 'package:flutter/material.dart';
import 'detail_info.dart';
import 'english_word_list.dart';
import 'chat.dart';
import 'animation.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Flutter',
        theme: new ThemeData(
            primaryColor: Colors.amber,
            accentColor: Colors.amber
        ),
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Main'),
              centerTitle: true,
            ),
            body: new MainScreen()
        )
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[

        // Detail info
        new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: new InkWell(
            onTap: () =>
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new DetailInfo()))
            ,
            child: new Container(
              padding: new EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                  color: new Color(0xff03a9f4),
                  borderRadius: new BorderRadius.circular(8.0)
              ),
              width: 400.0,
              child: new Text('Detail info screen',
                style: new TextStyle(color: Colors.white),
                textAlign: TextAlign.center,),
            ),
          ),
        ),

        // English word list
        new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: new InkWell(
              onTap: () =>
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new EnglishWordList()))
              ,
              child: new Container(
                padding: new EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                    color: new Color(0xff03a9f4),
                    borderRadius: new BorderRadius.circular(8.0)
                ),
                width: 400.0,
                child: new Text('English word list screen',
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),
              ),
            )
        ),

        // Animation
        new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: new InkWell(
              onTap: () =>
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new LogoApp()))
              ,
              child: new Container(
                padding: new EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                    color: new Color(0xff03a9f4),
                    borderRadius: new BorderRadius.circular(8.0)
                ),
                width: 400.0,
                child: new Text('Animation screen',
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),
              ),
            )
        ),

        // Chat
        new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: new InkWell(
              onTap: () =>
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new Chat()))
              ,
              child: new Container(
                padding: new EdgeInsets.all(15.0),
                decoration: new BoxDecoration(
                    color: new Color(0xff03a9f4),
                    borderRadius: new BorderRadius.circular(8.0)
                ),
                width: 400.0,
                child: new Text('Chat screen',
                  style: new TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),
              ),
            )
        ),
      ],
    );
  }
}