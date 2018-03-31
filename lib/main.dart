import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'detail_info.dart';
import 'english_word_list.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.black
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Main'),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(10.0),
              child: new InkWell(
                onTap: () =>
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new DetailInfo()))
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

          ],
        ),
      ),
    );
  }
}
