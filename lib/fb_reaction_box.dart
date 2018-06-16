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
  Animation zoomInIconLikeInBtn, tiltIconLikeInBtn, zoomInTextLikeInBtn;
  Animation fadeInBox;
  Animation moveRightGroupIcon;
  Animation pushIconLikeUp, pushIconLoveUp, pushIconHahaUp, pushIconWowUp, pushIconSadUp, pushIconAngryUp;
  Animation zoomInIconLike, zoomInIconLove, zoomInIconHaha, zoomInIconWow, zoomInIconSad, zoomInIconAngry;

  @override
  void initState() {
    super.initState();

    // Button
    animControlBtn = new AnimationController(vsync: this, duration: new Duration(milliseconds: 150));
    zoomInIconLikeInBtn = new Tween(begin: 1.0, end: 0.85).animate(animControlBtn);
    tiltIconLikeInBtn = new Tween(begin: 0.0, end: 0.03).animate(animControlBtn);
    zoomInTextLikeInBtn = new Tween(begin: 1.0, end: 0.85).animate(animControlBtn);

    zoomInIconLikeInBtn.addListener(() {
      setState(() {});
    });
    tiltIconLikeInBtn.addListener(() {
      setState(() {});
    });
    zoomInTextLikeInBtn.addListener(() {
      setState(() {});
    });

    // Box and Icons
    animControlBox = new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));

    // General
    moveRightGroupIcon = new Tween(begin: 0.0, end: 10.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 1.0)),
    );
    moveRightGroupIcon.addListener(() {
      setState(() {});
    });

    // Box
    fadeInBox = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.7, 1.0)),
    );
    fadeInBox.addListener(() {
      setState(() {});
    });

    // Icons
    pushIconLikeUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 0.5)),
    );
    zoomInIconLike = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 0.5)),
    );

    pushIconLoveUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.1, 0.6)),
    );
    zoomInIconLove = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.1, 0.6)),
    );

    pushIconHahaUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.2, 0.7)),
    );
    zoomInIconHaha = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.2, 0.7)),
    );

    pushIconWowUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.3, 0.8)),
    );
    zoomInIconWow = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.3, 0.8)),
    );

    pushIconSadUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.4, 0.9)),
    );
    zoomInIconSad = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.4, 0.9)),
    );

    pushIconAngryUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.5, 1.0)),
    );
    zoomInIconAngry = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.5, 1.0)),
    );

    pushIconLikeUp.addListener(() {
      setState(() {});
    });
    zoomInIconLike.addListener(() {
      setState(() {});
    });
    pushIconLoveUp.addListener(() {
      setState(() {});
    });
    zoomInIconLove.addListener(() {
      setState(() {});
    });
    pushIconHahaUp.addListener(() {
      setState(() {});
    });
    zoomInIconHaha.addListener(() {
      setState(() {});
    });
    pushIconWowUp.addListener(() {
      setState(() {});
    });
    zoomInIconWow.addListener(() {
      setState(() {});
    });
    pushIconSadUp.addListener(() {
      setState(() {});
    });
    zoomInIconSad.addListener(() {
      setState(() {});
    });
    pushIconAngryUp.addListener(() {
      setState(() {});
    });
    zoomInIconAngry.addListener(() {
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
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(30.0),
                    border: new Border.all(color: Colors.grey[300], width: 0.3),
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          // LTRB
                          offset: Offset.lerp(new Offset(0.0, 0.0), new Offset(0.0, 0.5), 10.0)),
                    ],
                  ),
                  width: 300.0,
                  height: 50.0,
                  margin: new EdgeInsets.only(top: 70.0, left: 10.0),
                ),
                opacity: this.fadeInBox.value,
              ),

              // Icons
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Transform.scale(
                      child: new Container(
                        child: new Image.asset(
                          'images/like.gif',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        margin: new EdgeInsets.only(bottom: pushIconLikeUp.value),
                      ),
                      scale: this.zoomInIconLike.value,
                    ),
                    new Transform.scale(
                      child: new Container(
                        child: new Image.asset(
                          'images/love.gif',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        margin: new EdgeInsets.only(bottom: pushIconLoveUp.value),
                      ),
                      scale: this.zoomInIconLove.value,
                    ),
                    new Transform.scale(
                      child: new Container(
                        child: new Image.asset(
                          'images/haha.gif',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        margin: new EdgeInsets.only(bottom: pushIconHahaUp.value),
                      ),
                      scale: this.zoomInIconHaha.value,
                    ),
                    new Transform.scale(
                      child: new Container(
                        child: new Image.asset(
                          'images/wow.gif',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        margin: new EdgeInsets.only(bottom: pushIconWowUp.value),
                      ),
                      scale: this.zoomInIconWow.value,
                    ),
                    new Transform.scale(
                      child: new Container(
                        child: new Image.asset(
                          'images/sad.gif',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        margin: new EdgeInsets.only(bottom: pushIconSadUp.value),
                      ),
                      scale: this.zoomInIconSad.value,
                    ),
                    new Transform.scale(
                      child: new Container(
                        child: new Image.asset(
                          'images/angry.gif',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        margin: new EdgeInsets.only(bottom: pushIconAngryUp.value),
                      ),
                      scale: this.zoomInIconAngry.value,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                width: 300.0,
                height: 250.0,
                margin: new EdgeInsets.only(left: this.moveRightGroupIcon.value),
                color: Colors.amber.withOpacity(0.5),
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
                        turns: tiltIconLikeInBtn,
                      ),
                      scale: zoomInIconLikeInBtn.value,
                    ),
                    new Transform.scale(
                      child: new Text(
                        'Like',
                        style: new TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      scale: zoomInTextLikeInBtn.value,
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
            margin: new EdgeInsets.only(top: 140.0),
          ),
        ],
      ),
      margin: new EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
    );
  }

  void onTapDownBtn(TapDownDetails tapDownDetail) {
    animControlBtn.forward();

    setForwardValue();
    animControlBox.forward();
  }

  void onTapUpBtn(TapUpDetails tapUpDetail) {
    animControlBtn.reverse();

    setReverseValue();
    animControlBox.reverse();
  }

  void onTapCancelBtn() {
//    animControlBtn.reverse();
//
//    setReverseValue();
//    animControlBox.reverse();
  }

  // We need to set the value for reverse because if not
  // the angry-icon will be pulled down first, not the like-icon
  void setReverseValue() {
    // Icons
    pushIconLikeUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.5, 1.0)),
    );
    zoomInIconLike = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.5, 1.0)),
    );

    pushIconLoveUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.4, 0.9)),
    );
    zoomInIconLove = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.4, 0.9)),
    );

    pushIconHahaUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.3, 0.8)),
    );
    zoomInIconHaha = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.3, 0.8)),
    );

    pushIconWowUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.2, 0.7)),
    );
    zoomInIconWow = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.2, 0.7)),
    );

    pushIconSadUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.1, 0.6)),
    );
    zoomInIconSad = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.1, 0.6)),
    );

    pushIconAngryUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 0.5)),
    );
    zoomInIconAngry = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 0.5)),
    );
  }

  // When set the reverse value, we need set value to normal for the forward
  void setForwardValue() {
    // Icons
    pushIconLikeUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 0.5)),
    );
    zoomInIconLike = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.0, 0.5)),
    );

    pushIconLoveUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.1, 0.6)),
    );
    zoomInIconLove = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.1, 0.6)),
    );

    pushIconHahaUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.2, 0.7)),
    );
    zoomInIconHaha = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.2, 0.7)),
    );

    pushIconWowUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.3, 0.8)),
    );
    zoomInIconWow = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.3, 0.8)),
    );

    pushIconSadUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.4, 0.9)),
    );
    zoomInIconSad = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.4, 0.9)),
    );

    pushIconAngryUp = new Tween(begin: 30.0, end: 60.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.5, 1.0)),
    );
    zoomInIconAngry = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animControlBox, curve: new Interval(0.5, 1.0)),
    );
  }
}
