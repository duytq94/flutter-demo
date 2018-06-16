import 'dart:async';

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
  int durationAnimationBox = 500;
  int durationAnimationBtnLongPress = 150;
  int durationAnimationBtnShortPress = 300;

  AnimationController animControlBtnLongPress, animControlBtnShortPress;
  AnimationController animControlBox;

  // For long press btn
  Animation zoomInIconLikeInBtn, tiltIconLikeInBtn, zoomInTextLikeInBtn;

  // For short press btn
  Animation zoomInIconLikeInBtn2, tiltIconLikeInBtn2, zoomInTextLikeInBtn2;

  Animation fadeInBox;
  Animation moveRightGroupIcon;
  Animation pushIconLikeUp, pushIconLoveUp, pushIconHahaUp, pushIconWowUp, pushIconSadUp, pushIconAngryUp;
  Animation zoomInIconLike, zoomInIconLove, zoomInIconHaha, zoomInIconWow, zoomInIconSad, zoomInIconAngry;

  Duration durationLongPress = new Duration(milliseconds: 250);
  Timer holdTimer;
  bool isLongPress = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    // ------------------------------- Button Like -------------------------------
    // long press
    animControlBtnLongPress =
        new AnimationController(vsync: this, duration: new Duration(milliseconds: durationAnimationBtnLongPress));
    zoomInIconLikeInBtn = new Tween(begin: 1.0, end: 0.85).animate(animControlBtnLongPress);
    tiltIconLikeInBtn = new Tween(begin: 0.0, end: 0.03).animate(animControlBtnLongPress);
    zoomInTextLikeInBtn = new Tween(begin: 1.0, end: 0.85).animate(animControlBtnLongPress);

    zoomInIconLikeInBtn.addListener(() {
      setState(() {});
    });
    tiltIconLikeInBtn.addListener(() {
      setState(() {});
    });
    zoomInTextLikeInBtn.addListener(() {
      setState(() {});
    });

    // short press
    animControlBtnShortPress =
        new AnimationController(vsync: this, duration: new Duration(milliseconds: durationAnimationBtnShortPress));
    zoomInIconLikeInBtn2 = new Tween(begin: 1.0, end: 0.7).animate(animControlBtnShortPress);
    tiltIconLikeInBtn2 = new Tween(begin: 0.0, end: -0.06).animate(animControlBtnShortPress);
    zoomInTextLikeInBtn2 = new Tween(begin: 1.0, end: 0.7).animate(animControlBtnShortPress);

    zoomInIconLikeInBtn2.addListener(() {
      setState(() {});
    });
    tiltIconLikeInBtn2.addListener(() {
      setState(() {});
    });
    zoomInTextLikeInBtn2.addListener(() {
      setState(() {});
    });

    // ------------------------------- Box and Icons -------------------------------
    animControlBox = new AnimationController(vsync: this, duration: new Duration(milliseconds: durationAnimationBox));

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
    animControlBtnLongPress.dispose();
    animControlBtnShortPress.dispose();
    animControlBox.dispose();
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
              new GestureDetector(
                child: new Container(
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
                ),
                onTapDown: onTapDownBoxIcon,
                onHorizontalDragStart: onHorizontalDragStartBoxIcon,
                onHorizontalDragUpdate: onHorizontalDragUpdateBoxIcon,
              )
            ],
          ),

          // Button like
          new Container(
            child: new GestureDetector(
              onTapDown: onTapDownBtn,
              onTapUp: onTapUpBtn,
              onTapCancel: onTapCancelBtn,
              onTap: onTapBtn,
              child: new Container(
                child: new Row(
                  children: <Widget>[
                    // Icon like
                    new Transform.scale(
                      child: new RotationTransition(
                        child: new Image.asset(
                          !isLongPress && isLiked ? 'images/ic_like_fill.png' : 'images/ic_like.png',
                          width: 25.0,
                          height: 25.0,
                          fit: BoxFit.contain,
                          color: !isLongPress && isLiked ? new Color(0xff3b5998) : Colors.grey,
                        ),
                        turns: !isLongPress && isLiked ? tiltIconLikeInBtn2 : tiltIconLikeInBtn,
                      ),
                      scale: !isLongPress && isLiked
                          ? handleOutputRangeZoomInIconLike(zoomInIconLikeInBtn2.value)
                          : zoomInIconLikeInBtn.value,
                    ),

                    // Text like
                    new Transform.scale(
                      child: new Text(
                        'Like',
                        style: new TextStyle(
                          color: !isLongPress && isLiked ? new Color(0xff3b5998) : Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      scale: !isLongPress && isLiked
                          ? handleOutputRangeZoomInTextLike(zoomInIconLikeInBtn2.value)
                          : zoomInTextLikeInBtn.value,
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
              color: Colors.white,
              border: new Border.all(color: Colors.grey[400]),
            ),
            margin: new EdgeInsets.only(top: 140.0),
          ),
        ],
      ),
      margin: new EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
    );
  }

  void onTapDownBoxIcon(TapDownDetails tapDownDetail) {
//    print('aaaaaaaaaaa');
  }

  void onHorizontalDragStartBoxIcon(DragStartDetails dragStartDetail) {
    print('aaaaaaaaaaa');
  }

  void onHorizontalDragUpdateBoxIcon(DragUpdateDetails dragUpdateDetail) {
    print('bbbbbbbbbbb');
  }

  void onTapDownBtn(TapDownDetails tapDownDetail) {
    holdTimer = new Timer.periodic(durationLongPress, showBox);
  }

  // when user short press
  void onTapBtn() {
    if (!isLongPress) {
      isLiked = !isLiked;
      if (isLiked) {
        animControlBtnShortPress.forward();
      } else {
        animControlBtnShortPress.reverse();
      }
    }
  }

  double handleOutputRangeZoomInIconLike(double value) {
    print(value);
    if (value >= 0.85) {
      return value;
    } else {
      return 0.7 + (1 - value);
    }
  }

  double handleOutputRangeTiltIconLike(double value) {
    if (value <= 0.03) {
      return value;
    } else {
      return 0.06 - value;
    }
  }

  double handleOutputRangeZoomInTextLike(double value) {
    if (value >= 0.85) {
      return value;
    } else {
      return 0.7 + (1 - value);
    }
  }

  void showBox(Timer t) {
    isLongPress = true;

    animControlBtnLongPress.forward();

    setForwardValue();
    animControlBox.forward();
  }

  void onTapUpBtn(TapUpDetails tapUpDetail) {
    new Timer(new Duration(milliseconds: durationAnimationBox), () {
      isLongPress = false;
    });

    holdTimer.cancel();

    animControlBtnLongPress.reverse();

    setReverseValue();
    animControlBox.reverse();
  }

  void onTapCancelBtn() {
    holdTimer.cancel();
    animControlBtnLongPress.reverse();

    setReverseValue();
    animControlBox.reverse();
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
