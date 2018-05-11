import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("ANIMATION"), centerTitle: true),
      body: new LogoApp(),
    );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> sizeAnim;
  Animation<double> blinkAnim;
  Animation<double> goUpDownAnim;
  Animation<double> goLeftRightAnim;
  Animation<double> rotateAnim;
  Animation<double> standAnim;

  AnimationController controller;
  int currentAnimation = 0;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);

    sizeAnim = new Tween(begin: 0.0, end: 100.0).animate(controller);
    blinkAnim = new Tween(begin: 0.0, end: 1.0).animate(controller);
    goUpDownAnim = new Tween(begin: 0.0, end: 100.0).animate(controller);
    goLeftRightAnim = new Tween(begin: 0.0, end: 100.0).animate(controller);
    rotateAnim = new Tween(begin: 0.0, end: 1.0).animate(controller);
    standAnim = new Tween(begin: 0.0, end: 0.0).animate(controller);

    sizeAnim.addListener(() {
      setState(() {});
    });
    blinkAnim.addListener(() {
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
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(height: 15.0),

          new Container(
//            color: Colors.black,
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            child: new Stack(
              children: <Widget>[
                new RotationTransition(
                  turns: currentAnimation == 4 ? rotateAnim : standAnim,
                  child: new Opacity(
                    opacity: currentAnimation == 3 ? blinkAnim.value : 1.0,
                    child: new Container(
                        color: Colors.red,
                        width: currentAnimation == 0 ? sizeAnim.value : 50.0,
                        height: currentAnimation == 0 ? sizeAnim.value : 50.0,
                        margin: (currentAnimation == 1
                            ? new EdgeInsets.only(bottom: goUpDownAnim.value)
                            : (currentAnimation == 2 ? new EdgeInsets.only(left: goLeftRightAnim.value) : null))
                    ),
                  ),
                )
              ],
            ),
          ),

          new Container(height: 15.0),
          new Row(
            children: <Widget>[
              _buildButton('ZOOM', setCurrentAnimation, 0),
              _buildButton('UP DOWN', setCurrentAnimation, 1),
            ],
          ),

          new Container(height: 15.0),
          new Row(
            children: <Widget>[
              _buildButton('LEFT RIGHT', setCurrentAnimation, 2),
              _buildButton('BLINK', setCurrentAnimation, 3),
            ],
          ),

          new Container(height: 15.0),
          new Row(
            children: <Widget>[
              _buildButton('ROTATE', setCurrentAnimation, 4),
              _buildButton('BLINK', setCurrentAnimation, 3),
            ],
          ),

        ],
      ),

    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
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

Widget _buildButton(String name, Function function, int number) {
  return new Material(
    child: new InkWell(
      onTap: () => function(number),
      child: new Container(
        child: new Text(
          name,
          style: new TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        margin: new EdgeInsets.all(13.0),
        width: 140.0,
      ),
    ),
    color: new Color(0xff03a9f4),
    borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
  );
}
