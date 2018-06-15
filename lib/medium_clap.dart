import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

enum CIRCLE_SCORE_STATUS { HIDDEN, BECOMING_VISIBLE, VISIBLE, BECOMING_INVISIBLE }

class MediumClapScreenState extends State<MediumClapScreen> with TickerProviderStateMixin {
  int _counter = 0;
  double _sparklesAngle = 0.0;
  CIRCLE_SCORE_STATUS circleScoreStatus = CIRCLE_SCORE_STATUS.HIDDEN;
  final duration = new Duration(milliseconds: 400);
  final oneSecond = new Duration(seconds: 1);
  Random random;
  Timer holdTimer, releaseBtnClapTimer;
  AnimationController scoreInAnimationController,
      scoreOutAnimationController,
      scoreSizeAnimationController,
      sparklesAnimationController;
  Animation scoreOutPositionAnimation, sparklesAnimation;

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'MEDIUM CLAP',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            renderNumberClap(),
            new Container(height: 20.0),
            new Stack(
              alignment: FractionalOffset.center,
              overflow: Overflow.visible,
              children: <Widget>[
                getScoreButton(),
                getClapButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    random = new Random();

    // Circle clap show
    scoreInAnimationController = new AnimationController(duration: new Duration(milliseconds: 150), vsync: this);
    scoreInAnimationController.addListener(() {
      setState(() {});
    });

    // Circle clap hide
    scoreOutAnimationController = new AnimationController(duration: duration, vsync: this);
    scoreOutAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        circleScoreStatus = CIRCLE_SCORE_STATUS.HIDDEN;
      }
    });
    scoreOutPositionAnimation = new Tween(begin: 100.0, end: 150.0)
        .animate(new CurvedAnimation(parent: scoreOutAnimationController, curve: Curves.easeOut));
    scoreOutPositionAnimation.addListener(() {
      setState(() {});
    });

    // Control score circle size and clap button size
    scoreSizeAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 150));
    scoreSizeAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        scoreSizeAnimationController.reverse();
      }
    });
    scoreSizeAnimationController.addListener(() {
      setState(() {});
    });

    // Size of sparkle
    sparklesAnimationController = new AnimationController(vsync: this, duration: duration);
    sparklesAnimation = new CurvedAnimation(parent: sparklesAnimationController, curve: Curves.easeIn);
    sparklesAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    scoreInAnimationController.dispose();
    scoreOutAnimationController.dispose();
  }

  void increment(Timer t) {
    scoreSizeAnimationController.forward(from: 0.0);
    sparklesAnimationController.forward(from: 0.0);
    setState(() {
      _counter++;
      _sparklesAngle = random.nextDouble();
    });
  }

  void onTapDown(TapDownDetails tap) {
    if (releaseBtnClapTimer != null && releaseBtnClapTimer.isActive) {
      releaseBtnClapTimer.cancel();
    }

    // when the circle flying up but user just tap down, need cancel this flying
    if (circleScoreStatus == CIRCLE_SCORE_STATUS.BECOMING_INVISIBLE) {
      scoreOutAnimationController.stop(canceled: true);
      circleScoreStatus = CIRCLE_SCORE_STATUS.VISIBLE;
    } else if (circleScoreStatus == CIRCLE_SCORE_STATUS.HIDDEN) {
      scoreInAnimationController.forward(from: 0.0);
      circleScoreStatus = CIRCLE_SCORE_STATUS.BECOMING_VISIBLE;
    }

    // for tap button
    increment(null);

    // for hold button
    holdTimer = new Timer.periodic(duration, increment);
  }

  void onTapUp(TapUpDetails tap) {
    // after duration, animation hide circle will start
    releaseBtnClapTimer = new Timer(duration, () {
      scoreOutAnimationController.forward(from: 0.0);
      circleScoreStatus = CIRCLE_SCORE_STATUS.BECOMING_INVISIBLE;
    });

    // cancel when user release button
    holdTimer.cancel();
  }

  void onTapCancel() {
    // after duration, animation hide circle will start
    releaseBtnClapTimer = new Timer(duration, () {
      scoreOutAnimationController.forward(from: 0.0);
      circleScoreStatus = CIRCLE_SCORE_STATUS.BECOMING_INVISIBLE;
    });

    // cancel when user release button
    holdTimer.cancel();
  }

  // Circle popup
  Widget getScoreButton() {
    double scorePosition = 0.0;
    double scoreOpacity = 0.0;
    double extraSize = 0.0;

    switch (circleScoreStatus) {
      case CIRCLE_SCORE_STATUS.HIDDEN:
        break;
      case CIRCLE_SCORE_STATUS.BECOMING_VISIBLE:
      case CIRCLE_SCORE_STATUS.VISIBLE:
        scorePosition = scoreInAnimationController.value * 100;
        scoreOpacity = scoreInAnimationController.value;
        extraSize = scoreSizeAnimationController.value * 5;
        break;
      case CIRCLE_SCORE_STATUS.BECOMING_INVISIBLE:
        scorePosition = scoreOutPositionAnimation.value;
        scoreOpacity = 1.0 - scoreOutAnimationController.value;
    }

    List<Widget> groupSparkle = <Widget>[];

    double firstAngle = _sparklesAngle;
    double sparkleRadius = sparklesAnimationController.value * 50;
    double sparklesOpacity = (1 - sparklesAnimation.value);

    for (int i = 0; i < 5; i++) {
      double currentAngle = firstAngle + ((2 * pi) / 5) * i;
      Widget sparklesWidget = new Positioned(
        child: new Transform.rotate(
          angle: currentAngle - pi / 2,
          child: new Opacity(
              opacity: sparklesOpacity, child: new Image.asset("images/sparkles.png", width: 14.0, height: 14.0)),
        ),
        left: sparkleRadius * cos(currentAngle) + 20,
        top: sparkleRadius * sin(currentAngle) + 20,
      );

      groupSparkle.add(sparklesWidget);
    }

    // Add circle after add sparkles
    groupSparkle.add(new Opacity(
        opacity: scoreOpacity,
        child: new Container(
            height: 50.0 + extraSize,
            width: 50.0 + extraSize,
            decoration: new ShapeDecoration(
              shape: new CircleBorder(side: BorderSide.none),
              color: Colors.amber,
            ),
            child: new Center(
                child: new Text(
              "+" + _counter.toString(),
              style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
            )))));

    return new Positioned(
        // Use Stack so the circle can cover the sparkles
        child: new Stack(
          alignment: FractionalOffset.center,
          overflow: Overflow.visible,
          children: groupSparkle,
        ),
        bottom: scorePosition);
  }

  // Clap button
  Widget getClapButton() {
    double extraSize = 0.0;
    if (circleScoreStatus == CIRCLE_SCORE_STATUS.VISIBLE || circleScoreStatus == CIRCLE_SCORE_STATUS.BECOMING_VISIBLE) {
      extraSize = scoreSizeAnimationController.value * 3;
    }

    // Using GestureDetector to handle claps when user holds the button.
    return new GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        child: new Container(
            height: 60.0 + extraSize,
            width: 60.0 + extraSize,
            padding: new EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
                border: new Border.all(color: Colors.amber, width: 1.0),
                borderRadius: new BorderRadius.circular(50.0),
                color: Colors.white,
                boxShadow: [new BoxShadow(color: Colors.amber, blurRadius: 8.0)]),
            child: new ImageIcon(
                circleScoreStatus == CIRCLE_SCORE_STATUS.HIDDEN
                    ? new AssetImage("images/clap.png")
                    : new AssetImage("images/clap_border.png"),
                color: Colors.amber,
                size: 40.0)));
  }

  // Text number clap
  Widget renderNumberClap() {
    if (circleScoreStatus == CIRCLE_SCORE_STATUS.HIDDEN) {
      return new Text(
        '$_counter',
        style: Theme.of(context).textTheme.title,
      );
    } else {
      return new Text(
        '',
        style: Theme.of(context).textTheme.title,
      );
    }
  }
}
