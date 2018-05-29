import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimation2 extends StatelessWidget {
  HeroAnimation2(this.imageName, this.description, this.opacityTransitionAnim, this.slowMode);

  final String imageName;
  final String description;
  final Animation opacityTransitionAnim;
  final double slowMode;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'PLANET',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new HeroAnimation2Screen(
          screenSize: MediaQuery.of(context).size,
          imageName: imageName,
          description: description,
          opacityTransitionAnim: opacityTransitionAnim,
          slowMode: slowMode),
    );
  }
}

class HeroAnimation2Screen extends StatefulWidget {
  final Size screenSize;
  final String imageName;
  final String description;
  final Animation opacityTransitionAnim;
  final double slowMode;

  HeroAnimation2Screen(
      {Key key,
      @required this.screenSize,
      @required this.imageName,
      @required this.description,
      @required this.opacityTransitionAnim,
      @required this.slowMode})
      : super(key: key);

  @override
  State createState() => HeroAnimation2ScreenState();
}

class HeroAnimation2ScreenState extends State<HeroAnimation2Screen> with TickerProviderStateMixin {
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;

  Size screenSize;
  String imageName;
  String description;
  Animation opacityTransitionAnim;
  double slowMode;

  AnimationController animControl;
  Animation rotateAnim;

  RectTween createRectTween(Rect begin, Rect end) {
    return new MaterialRectArcTween(begin: begin, end: end);
  }

  Widget buildPlanetPage(BuildContext context, String imageName, String description) {
    return new Container(
      color: Theme.of(context).canvasColor,
      child: new Center(
        child: new Card(
          elevation: 8.0,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              new SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: new RotationTransition(
                  child: new Hero(
                    createRectTween: createRectTween,
                    tag: imageName,
                    child: new RadialExpansion(
                      maxRadius: kMaxRadius,
                      child: new Photo(
                        photo: imageName,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  turns: rotateAnim,
                ),
              ),
              new Text(
                description,
                style: new TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    screenSize = widget.screenSize;
    imageName = widget.imageName;
    description = widget.description;
    opacityTransitionAnim = widget.opacityTransitionAnim;
    slowMode = widget.slowMode;

    animControl = new AnimationController(vsync: this, duration: new Duration(milliseconds: 5000));
    rotateAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.0, 1.0)));
    rotateAnim.addListener(() {
      setState(() {});
    });

    animControl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControl.repeat();
      }
    });
    new Timer(new Duration(milliseconds: 1000), () => animControl.forward());
  }

  @override
  void dispose() {
    animControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // this value have to the same with previous screen
    timeDilation = slowMode;

    return new Opacity(
      opacity: opacityCurve.transform(opacityTransitionAnim.value),
      child: buildPlanetPage(context, imageName, description),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: clipRectSize,
        height: clipRectSize,
        child: child,
      ),
    );
  }
}

class Photo extends StatelessWidget {
  Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: onTap,
        child: new Image.asset(
          photo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
