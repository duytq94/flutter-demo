import 'dart:async';

import 'package:flutter/material.dart';


class MediumClap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MediumClapScreen();
  }
}

class MediumClapScreen extends StatefulWidget {

  MediumClapScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State createState() => new MediumClapScreenState();
}

class MediumClapScreenState extends State<MediumClapScreen> with TickerProviderStateMixin {

  int _counter = 0;
  final duration = new Duration(microseconds: 300);
  Timer timer;

  AnimationController scoreInAnimationController, scoreOutAnimationController,
      scoreSizeAnimationController, sparklesAnimationController;

  @override
  void initState() {
    super.initState();
    scoreInAnimationController = new AnimationController(duration: new Duration(milliseconds: 200), vsync: this);
    scoreInAnimationController.addListener(() {
      setState(() {});
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  void increment(Timer t) {
    setState(() {
      _counter++;
    });
  }

  void onTapDown(TapDownDetails tap) {
    scoreInAnimationController.forward(from: 0.0);
    increment(null);
    timer = new Timer.periodic(duration, increment);
  }

  void onTapUp(TapUpDetails tap) {
    timer.cancel();
  }

  // Score circle
  Widget getScoreButton() {
    var scorePosition = scoreInAnimationController.value * 100;
    var scoreOpacity = scoreInAnimationController.value;

    return new Positioned(
        child: new Opacity(opacity: scoreOpacity, child: new Container(
            height: 50.0,
            width: 50.0,
            decoration: new ShapeDecoration(
              shape: new CircleBorder(
                  side: BorderSide.none
              ),
              color: Colors.pink,
            ),
            child: new Center(
                child: new Text("+" + _counter.toString(),
                  style: new TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),))
        )),
        bottom: scorePosition
    );
  }

  // Clap button
  Widget getClapButton() {
    // Using custom gesture detector because we want to keep increasing the claps
    // when user holds the button.
    return new GestureDetector(
        onTapUp: onTapUp,
        onTapDown: onTapDown,
        child: new Container(
          height: 60.0,
          width: 60.0,
          padding: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              border: new Border.all(color: Colors.pink, width: 1.0),
              borderRadius: new BorderRadius.circular(50.0),
              color: Colors.white,
              boxShadow: [
                new BoxShadow(color: Colors.pink, blurRadius: 8.0)
              ]
          ),
            child: new ImageIcon(
                new AssetImage("images/clap.png"), color: Colors.pink,
                size: 40.0
            )

        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MEDIUM CLAP'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:'),
            new Text('$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            )
          ],
        ),
      ),
      floatingActionButton: new Padding(
          padding: new EdgeInsets.only(right: 20.0),
          child: new Stack(
            alignment: FractionalOffset.center,
            overflow: Overflow.visible,
            children: <Widget>[
              getScoreButton(),
              getClapButton(),
            ],
          )
      ),
    );
  }

}