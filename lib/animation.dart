import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Animation"), centerTitle: true),
      body: new LogoApp(),
    );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> sizeAnimation;
  Animation<double> opacityAnimation;
  AnimationController controller;
  int currentAnimation = 1;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);

    sizeAnimation = new Tween(begin: 0.0, end: 100.0).animate(controller);
    opacityAnimation = new Tween(begin: 0.0, end: 1.0).animate(controller);

    sizeAnimation.addListener(() {
      setState(() {});
    });
    opacityAnimation.addListener(() {
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
      body: new Container(
        color: Colors.grey,
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Opacity(
                    opacity: currentAnimation == 2 ? opacityAnimation.value : 1.0,
                    child: new Container(
                      color: Colors.blue,
                      width: currentAnimation == 1 ? sizeAnimation.value : 100.0,
                      height: currentAnimation == 1 ? sizeAnimation.value : 100.0,
                    ),
                  ),
                ],
              ),
            ),
            new Container(height: 15.0),
            _buildButton('ZOOM', setCurrentAnimation, 0),
            new Container(height: 15.0),
            _buildButton('SLIDE UP', setCurrentAnimation, 1),
            new Container(height: 15.0),
            _buildButton('MOVE', setCurrentAnimation, 2),
            new Container(height: 15.0),
            _buildButton('BLINK', setCurrentAnimation, 3),
            new Container(height: 15.0),
            _buildButton('ROTATE', setCurrentAnimation, 3),
          ],
        ),
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

class SlideUpLogo extends AnimatedWidget {
  SlideUpLogo({Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: animation.value),
      child: new FlutterLogo(size: 100.0),
    );
  }
}

class MoveLogo extends AnimatedWidget {
  MoveLogo({Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
      margin: new EdgeInsets.symmetric(horizontal: animation.value),
      child: new FlutterLogo(size: 100.0),
    );
  }
}

class BlinkLogo extends AnimatedWidget {
  BlinkLogo({Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Opacity(
      opacity: animation.value > 50 ? 1.0 : 0.0,
      child: new FlutterLogo(size: 100.0),
    );
  }
}

class RotateLogo extends AnimatedWidget {
  RotateLogo({Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new RotationTransition(
      turns: animation,
      child: new FlutterLogo(size: 100.0),
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
        width: 280.0,
      ),
    ),
    color: new Color(0xff03a9f4),
    borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
  );
}
