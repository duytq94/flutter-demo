import 'dart:async';

import 'package:demo_flutter/hero_animation/planet.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimation2 extends StatelessWidget {
  HeroAnimation2(this.planet, this.opacityTransitionAnim, this.durationSlowMode);

  final Planet planet;
  final Animation opacityTransitionAnim;
  final double durationSlowMode;

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
          planet: planet,
          opacityTransitionAnim: opacityTransitionAnim,
          durationSlowMode: durationSlowMode),
    );
  }
}

class HeroAnimation2Screen extends StatefulWidget {
  final Size screenSize;
  final Planet planet;
  final Animation opacityTransitionAnim;
  final double durationSlowMode;

  HeroAnimation2Screen(
      {Key key,
      @required this.screenSize,
      @required this.planet,
      @required this.opacityTransitionAnim,
      @required this.durationSlowMode})
      : super(key: key);

  @override
  State createState() => HeroAnimation2ScreenState();
}

class HeroAnimation2ScreenState extends State<HeroAnimation2Screen> with TickerProviderStateMixin {
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;

  Size screenSize;
  Planet planet;
  Animation opacityTransitionAnim;
  double durationSlowMode;

  AnimationController animControl;
  Animation rotateAnim;

  Color gradientStart = Colors.deepPurple;
  Color gradientEnd = Colors.purple;

  RectTween createRectTween(Rect begin, Rect end) {
    return new MaterialRectArcTween(begin: begin, end: end);
  }

  Widget buildPlanetPage(BuildContext context, Planet planet) {
    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [gradientEnd, gradientStart],
              begin: new FractionalOffset(0.0, 0.5),
              end: new FractionalOffset(0.5, 1.0),
              tileMode: TileMode.clamp)),
      child: new Center(
        child: new Column(
          children: [
            new SizedBox(
              width: kMaxRadius * 2.0,
              height: kMaxRadius * 2.0,
              child: new RotationTransition(
                child: new Hero(
                  createRectTween: createRectTween,
                  tag: planet.name,
                  child: new RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: new Photo(
                      photo: planet.imagePath,
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
              planet.name.toUpperCase(),
              style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10.0),
              textScaleFactor: 3.0,
            ),
            new Expanded(
              child: new Card(
                child: new Container(
                  child: new SingleChildScrollView(
                    child: new Text(
                      planet.description,
                      style: new TextStyle(color: Colors.white70),
                    ),
                  ),
                  margin: new EdgeInsets.all(20.0),
                  height: 100.0,
                ),
                color: Colors.transparent,
                margin: new EdgeInsets.all(20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    screenSize = widget.screenSize;
    planet = widget.planet;
    opacityTransitionAnim = widget.opacityTransitionAnim;
    durationSlowMode = widget.durationSlowMode;

    animControl = new AnimationController(vsync: this, duration: new Duration(milliseconds: 60000));
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
    timeDilation = durationSlowMode;

    return new Opacity(
//      opacity: opacityCurve.transform(opacityTransitionAnim.value),
      opacity: 1.0,
      child: buildPlanetPage(context, planet),
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
      child: new FlatButton(
        onPressed: onTap,
        child: new Image.asset(
          photo,
          fit: BoxFit.contain,
        ),
        padding: new EdgeInsets.all(0.0),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
