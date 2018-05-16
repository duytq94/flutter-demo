import 'package:demo_flutter/medium_clap.dart';
import 'package:demo_flutter/music_player/music_player.dart';
import 'package:demo_flutter/restaurant_animation.dart';
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
    return new Material(
      child: new Center(
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
              _buildButton(context, 'Music player screen', new MusicPlayer()),

              new Container(height: 15.0,),
              _buildButton(context, 'Medium clap screen', new MediumClap()),

              new Container(height: 15.0,),
              _buildButton(context, 'Restaurant animation screen', new RestaurantAnimation())

            ],
          )
      ),
    );
  }

  Widget _buildButton(BuildContext context, String name, StatelessWidget screenTo) {
    return new FlatButton(
      onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => screenTo)),
      child: new Container(
        child: new Text(
          name,
          style: new TextStyle(color: Colors.white, fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        width: 270.0,
      ),
      color: new Color(0xff03a9f4),
      highlightColor: new Color(0xffbae3fa),
      padding: new EdgeInsets.all(12.0),
    );
  }
}