import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SimpleAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
            'SIMPLE ANIMATION',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: new SimpleAnimationScreen(),
    );
  }
}

class SimpleAnimationScreen extends StatefulWidget {
  SimpleAnimationScreenState createState() => new SimpleAnimationScreenState();
}

class SimpleAnimationScreenState extends State<SimpleAnimationScreen> with SingleTickerProviderStateMixin {
  Animation<double> sizeAnim;
  Animation<double> fadeAnim;
  Animation<double> goUpDownAnim;
  Animation<double> goLeftRightAnim;
  Animation<double> rotateAnim;
  Animation<double> stopAnim;

  AnimationController controller;
  int currentAnimation = 5;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);

    sizeAnim = new Tween(begin: 0.0, end: 100.0).animate(controller);
    fadeAnim = new Tween(begin: 0.0, end: 1.0).animate(controller);
    goUpDownAnim = new Tween(begin: 0.0, end: 100.0).animate(controller);
    goLeftRightAnim = new Tween(begin: 0.0, end: 100.0).animate(controller);
    rotateAnim = new Tween(begin: 0.0, end: 1.0).animate(controller);
    stopAnim = new Tween(begin: 0.0, end: 0.0).animate(controller);

    sizeAnim.addListener(() {
      setState(() {});
    });
    fadeAnim.addListener(() {
      setState(() {});
    });
    goUpDownAnim.addListener(() {
      setState(() {});
    });
    goLeftRightAnim.addListener(() {
      setState(() {});
    });
    rotateAnim.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  setCurrentAnimation(int number) {
    print(number);
    setState(() {
      currentAnimation = number;
    });
  }

  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(height: 15.0),
          new Container(
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            child: new Stack(
              children: <Widget>[
                new RotationTransition(
                  turns: currentAnimation == 4 ? rotateAnim : stopAnim,
                  child: new Opacity(
                    opacity: currentAnimation == 3 ? fadeAnim.value : 1.0,
                    child: new Container(
                        child: new Image.asset(
                          'images/logo_uit.png',
                        ),
                        width: currentAnimation == 0 ? sizeAnim.value : 50.0,
                        height: currentAnimation == 0 ? sizeAnim.value : 50.0,
                        margin: (currentAnimation == 1
                            ? new EdgeInsets.only(bottom: goUpDownAnim.value)
                            : (currentAnimation == 2 ? new EdgeInsets.only(left: goLeftRightAnim.value) : null))),
                  ),
                )
              ],
            ),
          ),
          new Container(height: 15.0),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                buildButton('ZOOM', setCurrentAnimation, 0),
                new Expanded(child: new Container()),
                buildButton('UP DOWN', setCurrentAnimation, 1),
              ],
            ),
          ),
          new Container(height: 15.0),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                buildButton('LEFT RIGHT', setCurrentAnimation, 2),
                new Expanded(child: new Container()),
                buildButton('FADE', setCurrentAnimation, 3),
              ],
            ),
          ),
          new Container(height: 15.0),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                buildButton('ROTATE', setCurrentAnimation, 4),
                new Expanded(child: new Container()),
                buildButton('STOP', setCurrentAnimation, 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dispose() {
    super.dispose();
    controller.dispose();
  }
}

class ZoomLogo extends AnimatedWidget {
  ZoomLogo({Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
}

Widget buildButton(String name, Function function, int number) {
  return new FlatButton(
    onPressed: () => function(number),
    child: new Container(
      child: new Text(
        name,
        style: new TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      width: 140.0,
    ),
    color: new Color(0xff03a9f4),
    highlightColor: new Color(0xffbae3fa),
    padding: new EdgeInsets.all(12.0),
  );
}
