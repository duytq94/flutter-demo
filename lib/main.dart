import 'package:demo_flutter/music_player.dart';
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
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('MAIN'),
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
    return new Center(
        child: new Column(
          children: <Widget>[

            new Container(height: 15.0),
            _buildButton(context, 'Detail info screen', new DetailInfo()),

            new Container(height: 15.0),
            _buildButton(context, 'English word list screen', new EnglishWordList()),

            new Container(height: 15.0),
            _buildButton(context, 'Animation screen', new AnimationScreen()),

            new Container(height: 15.0),
            _buildButton(context, 'Chat screen', new Chat()),

            new Container(height: 15.0,),
            _buildButton(context, 'Music player screen', new MusicPlayer())

          ],
        )
    );
  }

  Widget _buildButton(BuildContext context, String name, StatelessWidget screenTo) {
    return new Material(
      child: new InkWell(
        onTap: () =>
            Navigator.push(context, new MaterialPageRoute(builder: (context) => screenTo))
        ,
        child: new Container(
          child: new Text(
            name,
            style: new TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          margin: new EdgeInsets.all(13.0),
          width: 280.0,
        ),
      ),
      color: new Color(0xff03a9f4),
      borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
    );
  }
}