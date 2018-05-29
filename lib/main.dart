import 'package:demo_flutter/edit_profile.dart';
import 'package:demo_flutter/fetch_api.dart';
import 'package:demo_flutter/hero_animation/hero_animation.dart';
import 'package:demo_flutter/medium_clap.dart';
import 'package:demo_flutter/music_player/music_player.dart';
import 'package:demo_flutter/restaurant_animation/restaurant_animation.dart';
import 'package:flutter/material.dart';
import 'detail_info.dart';
import 'english_word_list.dart';
import 'chat.dart';
import 'simple_animation.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Flutter',
        theme: new ThemeData(primaryColor: Colors.amber, accentColor: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'MAIN',
                style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: new MainScreen()));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Center(
        child: new Column(
          children: <Widget>[
            _buildButton(context, 'Restaurant animation screen', new RestaurantAnimation()),
            _buildButton(context, 'Hero animation screen', new HeroAnimation()),
            _buildButton(context, 'Simple animation screen', new SimpleAnimationScreen()),
            _buildButton(context, 'Edit profile screen', new EditProfile()),
            _buildButton(context, 'Music player screen', new MusicPlayer()),
            _buildButton(context, 'Medium clap screen', new MediumClap()),
            _buildButton(context, 'Fetch api screen', new FetchApi()),
            _buildButton(context, 'Detail info screen', new DetailInfo()),
            _buildButton(context, 'English word list screen', new EnglishWordList()),
            _buildButton(context, 'Chat screen', new Chat()),
          ],
        ),
      ),
      padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
    );
  }

  Widget _buildButton(BuildContext context, String name, StatelessWidget screenTo) {
    return new Container(
      child: new FlatButton(
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
      ),
      margin: new EdgeInsets.all(8.0),
    );
  }
}
