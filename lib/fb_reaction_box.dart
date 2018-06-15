import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FbReactionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'FB REACTION',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: new FbReaction());
  }
}

class FbReaction extends StatefulWidget {
  @override
  createState() => new FbReactionState();
}

class FbReactionState extends State<FbReaction> with TickerProviderStateMixin {
  AnimationController animControlBtn, animControlBox;
  Animation zoomIconLikeAnim, tiltIconLike, zoomTextLikeAnim;
  Animation pushBoxUp, fadeInBox;
  Animation pushIconLikeUp, pushIconLoveUp, pushIconHahaUp, pushIconWowUp, pushIconSadUp, pushIconAngryUp;
  Animation fadeInIconLike, fadeInIconLove, fadeInIconHaha, fadeInIconWow, fadeInIconSad, fadeInIconAngry;

  @override
  void initState() {
    super.initState();

    // Button
    animControlBtn = new AnimationController(vsync: this, duration: new Duration(milliseconds: 150));
    zoomIconLikeAnim = new Tween(begin: 1.0, end: 0.85).animate(animControlBtn);
    tiltIconLike = new Tween(begin: 0.0, end: 0.03).animate(animControlBtn);
    zoomTextLikeAnim = new Tween(begin: 1.0, end: 0.85).animate(animControlBtn);

    zoomIconLikeAnim.addListener(() {
      setState(() {});
    });
    tiltIconLike.addListener(() {
      setState(() {});
    });
    zoomTextLikeAnim.addListener(() {
      setState(() {});
    });

    // Box and Icons
    animControlBox = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000));

    // Box
    pushBoxUp = new Tween(begin: 50.0, end: 0.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 1.0)),
    );
    fadeInBox = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 1.0)),
    );

    pushBoxUp.addListener(() {
      setState(() {});
    });
    fadeInBox.addListener(() {
      setState(() {});
    });

    // Icons
    pushIconLikeUp = new Tween(begin: 50.0, end: 10.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 1.0)),
    );
    pushIconLikeUp.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    super.dispose();
    animControlBtn.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Container(
      child: new Stack(
        children: <Widget>[
          // Box and icons
          new Stack(
            children: <Widget>[
              // Box
              new Opacity(
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  width: 300.0,
                  height: 50.0,
                  margin: new EdgeInsets.only(top: this.pushBoxUp.value),
                ),
                opacity: this.fadeInBox.value,
              ),

              // Icons
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Image.asset(
                        'images/like.gif',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.contain,
                      ),
                      margin: new EdgeInsets.only(top: 0.0),
                    ),
                    new Image.asset(
                      'images/love.gif',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.contain,
                    ),
                    new Image.asset(
                      'images/haha.gif',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.contain,
                    ),
                    new Image.asset(
                      'images/wow.gif',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.contain,
                    ),
                    new Image.asset(
                      'images/sad.gif',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.contain,
                    ),
                    new Image.asset(
                      'images/angry.gif',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.contain,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                width: 300.0,
                height: 100.0,
                color: Colors.amber,
              )
            ],
          ),

          // Button like
          new Container(
            child: new GestureDetector(
              onTapDown: onTapDownBtn,
              onTapUp: onTapUpBtn,
              onTapCancel: onTapCancelBtn,
              child: new Container(
                child: new Row(
                  children: <Widget>[
                    new Transform.scale(
                      child: new RotationTransition(
                        child: new Image.asset(
                          'images/ic_like.png',
                          width: 25.0,
                          height: 25.0,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                        turns: tiltIconLike,
                      ),
                      scale: zoomIconLikeAnim.value,
                    ),
                    new Transform.scale(
                      child: new Text(
                        'Like',
                        style: new TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      scale: zoomTextLikeAnim.value,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                padding: new EdgeInsets.all(10.0),
                color: Colors.transparent,
              ),
            ),
            width: 100.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(4.0),
              color: new Color(0xff3b5998),
            ),
            margin: new EdgeInsets.only(top: 70.0),
          ),
        ],
      ),
      margin: new EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
    );
  }

  void onTapDownBtn(TapDownDetails tapDownDetail) {
    animControlBtn.forward();
    animControlBox.forward();
  }

  void onTapUpBtn(TapUpDetails tapUpDetail) {
    animControlBtn.reverse();
    animControlBox.reverse();
  }

  void onTapCancelBtn() {
    animControlBtn.reverse();
    animControlBox.reverse();
  }
}
