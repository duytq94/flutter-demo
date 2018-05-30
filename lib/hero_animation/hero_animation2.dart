import 'dart:async';
import 'dart:math';

import 'package:demo_flutter/hero_animation/planet.dart';
import 'package:flutter/material.dart';
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
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        iconTheme: new IconThemeData(color: Colors.white),
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

  AnimationController animControlPlanet, animControlIndicator, animControlSatellite;
  Animation rotateAnimPlanet;
  Animation rotateAnimSatellite;
  Animation colorAnimIndicator1,
      colorAnimIndicator2,
      colorAnimIndicator3,
      colorAnimIndicator4,
      colorAnimIndicator5,
      colorAnimIndicator6;

  Color gradientStart = Colors.deepPurple;
  Color gradientEnd = Colors.purple;

  Color indicatorColorStart1 = Colors.blue[900];
  Color indicatorColorStart2 = Colors.yellow[900];
  Color indicatorColorEnd1 = Colors.blue[500];
  Color indicatorColorEnd2 = Colors.yellow[500];

  RectTween createRectTween(Rect begin, Rect end) {
    return new MaterialRectArcTween(begin: begin, end: end);
  }

  @override
  void initState() {
    super.initState();
    screenSize = widget.screenSize;
    planet = widget.planet;
    opacityTransitionAnim = widget.opacityTransitionAnim;
    durationSlowMode = widget.durationSlowMode;

    // Planet
    animControlPlanet = new AnimationController(vsync: this, duration: new Duration(milliseconds: 60000));
    rotateAnimPlanet = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPlanet, curve: new Interval(0.0, 1.0)));
    rotateAnimPlanet.addListener(() {
      setState(() {});
    });
    animControlPlanet.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlPlanet.repeat();
      }
    });

    // Tabs indicator
    animControlIndicator = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));
    colorAnimIndicator1 = new ColorTween(begin: indicatorColorStart1, end: indicatorColorEnd1)
        .animate(new CurvedAnimation(parent: animControlIndicator, curve: new Interval(0.1, 0.3)));
    colorAnimIndicator2 = new ColorTween(begin: indicatorColorStart1, end: indicatorColorEnd1)
        .animate(new CurvedAnimation(parent: animControlIndicator, curve: new Interval(0.3, 0.6)));
    colorAnimIndicator3 = new ColorTween(begin: indicatorColorStart1, end: indicatorColorEnd1)
        .animate(new CurvedAnimation(parent: animControlIndicator, curve: new Interval(0.6, 0.9)));
    colorAnimIndicator4 = new ColorTween(begin: indicatorColorStart2, end: indicatorColorEnd2)
        .animate(new CurvedAnimation(parent: animControlIndicator, curve: new Interval(0.1, 0.3)));
    colorAnimIndicator5 = new ColorTween(begin: indicatorColorStart2, end: indicatorColorEnd2)
        .animate(new CurvedAnimation(parent: animControlIndicator, curve: new Interval(0.3, 0.6)));
    colorAnimIndicator6 = new ColorTween(begin: indicatorColorStart2, end: indicatorColorEnd2)
        .animate(new CurvedAnimation(parent: animControlIndicator, curve: new Interval(0.6, 0.9)));
    animControlIndicator.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlIndicator.repeat();
      }
    });

    // Satellite
    animControlSatellite = new AnimationController(vsync: this, duration: new Duration(milliseconds: 10000));
    rotateAnimSatellite = new Tween(begin: 0.0, end: 1.0).animate(animControlSatellite);
    animControlSatellite.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlSatellite.repeat();
      }
    });

    // Let's go
    new Timer(new Duration(milliseconds: 1000), () {
      animControlPlanet.forward();
      animControlIndicator.forward();
      animControlSatellite.forward();
    });
  }

  @override
  void dispose() {
    animControlPlanet.dispose();
    animControlIndicator.dispose();
    animControlSatellite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // this value have to the same with previous screen
    timeDilation = durationSlowMode;

    return new Opacity(
//      opacity: opacityCurve.transform(opacityTransitionAnim.value),
      opacity: 1.0,
      child: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [gradientEnd, gradientStart],
                begin: new FractionalOffset(0.0, 0.5),
                end: new FractionalOffset(0.5, 1.0),
                tileMode: TileMode.clamp)),
        child: new Center(
          child: new Column(
            children: [
              // Photo
              new SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: new Container(
                  child: new CustomPaint(
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
                      turns: rotateAnimPlanet,
                    ),
                    foregroundPainter: new RadialSeekBarPainter(
                        trackWidth: 3.0,
                        trackColor: Colors.orange,
                        progressWidth: 0.0,
                        progressColor: Colors.transparent,
                        progressPercent: 0.8,
                        thumbSize: 15.0,
                        thumbColor: Colors.cyan,
                        thumbPosition: rotateAnimSatellite.value),
                  ),
                  margin: new EdgeInsets.all(15.0),
                ),
              ),

              // Title
              new Text(
                planet.name.toUpperCase(),
                style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 8.0),
                textScaleFactor: 3.0,
              ),

              // Bars indicator
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 1,
                      child: new Container(
                        width: double.infinity,
                        height: 5.0,
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: new BoxDecoration(
                            gradient:
                                new LinearGradient(colors: [colorAnimIndicator1.value, colorAnimIndicator4.value]),
                            borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new Container(
                        width: double.infinity,
                        height: 5.0,
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: new BoxDecoration(
                            gradient:
                                new LinearGradient(colors: [colorAnimIndicator2.value, colorAnimIndicator5.value]),
                            borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new Container(
                        width: double.infinity,
                        height: 5.0,
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: new BoxDecoration(
                            gradient:
                                new LinearGradient(colors: [colorAnimIndicator3.value, colorAnimIndicator6.value]),
                            borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
                      ),
                    ),
                  ],
                ),
                margin: new EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              ),

              // Description
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
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : clipRectSize = 2.0 * (maxRadius / sqrt2),
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
        padding: new EdgeInsets.all(15.0),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}

class RadialSeekBarPainter extends CustomPainter {
  final double trackWidth;
  final Paint trackPaint;
  final double progressWidth;
  final Paint progressPaint;
  final double progressPercent;
  final double thumbSize;
  final Paint thumbPaint;
  final double thumbPosition;

  RadialSeekBarPainter({
    @required this.trackWidth,
    @required trackColor,
    @required this.progressWidth,
    @required progressColor,
    @required this.progressPercent,
    @required this.thumbSize,
    @required thumbColor,
    @required this.thumbPosition,
  })  : trackPaint = new Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth,
        progressPaint = new Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = progressWidth
          ..strokeCap = StrokeCap.round,
        thumbPaint = new Paint()
          ..color = thumbColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final outerThickness = max(trackWidth, max(progressWidth, thumbSize));
    Size constrainedSize = new Size(
      size.width - outerThickness,
      size.height - outerThickness,
    );

    final center = new Offset(size.width / 2, size.height / 2);
    final radius = min(constrainedSize.width, constrainedSize.height) / 2;

    // Paint track.
    canvas.drawCircle(
      center,
      radius,
      trackPaint,
    );

    // Paint progress.
    final progressAngle = 2 * pi * progressPercent;
    canvas.drawArc(
      new Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi / 2,
      progressAngle,
      false,
      progressPaint,
    );

    // Paint thumb.
    final thumbAngle = 2 * pi * thumbPosition - (pi / 2);
    final thumbX = cos(thumbAngle) * radius;
    final thumbY = sin(thumbAngle) * radius;
    final thumbCenter = new Offset(thumbX, thumbY) + center;
    final thumbRadius = thumbSize / 2.0;
    canvas.drawCircle(
      thumbCenter,
      thumbRadius,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
