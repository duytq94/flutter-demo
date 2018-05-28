import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'HERO ANIMATION',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new HeroAnimationScreen(
        screenSize: MediaQuery.of(context).size,
      ),
    );
  }
}

class HeroAnimationScreen extends StatefulWidget {
  final Size screenSize;

  HeroAnimationScreen({Key key, @required this.screenSize}) : super(key: key);

  @override
  State createState() => HeroAnimationScreenState();
}

class HeroAnimationScreenState extends State<HeroAnimationScreen> with TickerProviderStateMixin {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  AnimationController animControl;
  Animation fadeAnim1, fadeAnim2, fadeAnim3, fadeAnim4, sizeAnim, rotateAnim;
  Size screenSize;
  List<Star> listStar;
  int numStars;

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

  Widget buildHeroIcon(BuildContext context, String imageName, String description) {
    return new Container(
      width: 100.0,
      height: 100.0,
      margin: new EdgeInsets.all(10.0),
      child: new Hero(
        createRectTween: createRectTween,
        tag: imageName,
        child: new RadialExpansion(
          maxRadius: kMaxRadius,
          child: new Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(new PageRouteBuilder<Null>(pageBuilder:
                  (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                return new AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget child) {
                      return new Scaffold(
                        appBar: new AppBar(
                          title: new Text(
                            'PLANET',
                            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          centerTitle: true,
                        ),
                        body: new Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: buildPlanetPage(context, imageName, description),
                        ),
                      );
                    });
              }));
            },
          ),
        ),
      ),
    );
  }

  Widget buildStar(double left, double top, double extraSize, double angle, int typeFade) {
    return new Positioned(
      child: new Container(
        child: new Transform.rotate(
          child: new Opacity(
            child: new Icon(
              Icons.star,
              color: Colors.white,
              size: sizeAnim.value + extraSize,
            ),
            opacity: (typeFade == 1)
                ? fadeAnim1.value
                : (typeFade == 2) ? fadeAnim2.value : (typeFade == 3) ? fadeAnim3.value : fadeAnim4.value,
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
        width: 10.0,
        height: 10.0,
      ),
      left: left,
      top: top,
    );
  }

  Widget buildGroupStar() {
    return new Stack(
      children: <Widget>[
        buildStar(listStar[0].left, listStar[0].top, listStar[0].extraSize, listStar[0].angle, listStar[0].typeFade),
        buildStar(listStar[1].left, listStar[1].top, listStar[1].extraSize, listStar[1].angle, listStar[1].typeFade),
        buildStar(listStar[2].left, listStar[2].top, listStar[2].extraSize, listStar[2].angle, listStar[2].typeFade),
        buildStar(listStar[3].left, listStar[3].top, listStar[3].extraSize, listStar[3].angle, listStar[3].typeFade),
        buildStar(listStar[4].left, listStar[4].top, listStar[4].extraSize, listStar[4].angle, listStar[4].typeFade),
        buildStar(listStar[5].left, listStar[5].top, listStar[5].extraSize, listStar[5].angle, listStar[5].typeFade),
        buildStar(listStar[6].left, listStar[6].top, listStar[6].extraSize, listStar[6].angle, listStar[6].typeFade),
        buildStar(listStar[7].left, listStar[7].top, listStar[7].extraSize, listStar[7].angle, listStar[7].typeFade),
        buildStar(listStar[8].left, listStar[8].top, listStar[8].extraSize, listStar[8].angle, listStar[8].typeFade),
        buildStar(listStar[9].left, listStar[9].top, listStar[9].extraSize, listStar[9].angle, listStar[9].typeFade),
        buildStar(
            listStar[10].left, listStar[10].top, listStar[10].extraSize, listStar[10].angle, listStar[10].typeFade),
        buildStar(
            listStar[11].left, listStar[11].top, listStar[11].extraSize, listStar[11].angle, listStar[11].typeFade),
        buildStar(
            listStar[12].left, listStar[12].top, listStar[12].extraSize, listStar[12].angle, listStar[12].typeFade),
        buildStar(
            listStar[13].left, listStar[13].top, listStar[13].extraSize, listStar[13].angle, listStar[13].typeFade),
        buildStar(
            listStar[14].left, listStar[14].top, listStar[14].extraSize, listStar[14].angle, listStar[14].typeFade),
        buildStar(
            listStar[15].left, listStar[15].top, listStar[15].extraSize, listStar[15].angle, listStar[15].typeFade),
        buildStar(
            listStar[16].left, listStar[16].top, listStar[16].extraSize, listStar[16].angle, listStar[16].typeFade),
        buildStar(
            listStar[17].left, listStar[17].top, listStar[17].extraSize, listStar[17].angle, listStar[17].typeFade),
        buildStar(
            listStar[18].left, listStar[18].top, listStar[18].extraSize, listStar[18].angle, listStar[18].typeFade),
        buildStar(
            listStar[19].left, listStar[19].top, listStar[19].extraSize, listStar[19].angle, listStar[19].typeFade),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    screenSize = widget.screenSize;
    listStar = new List();
    numStars = 20;

    animControl = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));
    fadeAnim1 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.0, 0.5)));
    fadeAnim1.addListener(() {
      setState(() {});
    });
    fadeAnim2 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.5, 1.0)));
    fadeAnim2.addListener(() {
      setState(() {});
    });
    fadeAnim3 = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.0, 0.5)));
    fadeAnim3.addListener(() {
      setState(() {});
    });
    fadeAnim4 = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.5, 1.0)));
    fadeAnim4.addListener(() {
      setState(() {});
    });
    sizeAnim = new Tween(begin: 0.0, end: 5.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.0, 0.5)));
    sizeAnim.addListener(() {
      setState(() {});
    });
    rotateAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControl, curve: new Interval(0.0, 0.5)));
    rotateAnim.addListener(() {
      setState(() {});
    });

    animControl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControl.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animControl.forward();
      }
    });

    for (int i = 0; i < numStars; i++) {
      listStar.add(new Star(
          left: new Random().nextDouble() * screenSize.width,
          top: Random().nextDouble() * screenSize.height,
          extraSize: Random().nextDouble() * 3,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4)));
    }

    animControl.forward();
  }

  @override
  void dispose() {
    animControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;

    return new Stack(
      children: <Widget>[
        new Container(width: double.infinity, height: double.infinity, color: Colors.black, child: buildGroupStar()),
        new SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                buildHeroIcon(context, 'images/ic_sun.png', 'Sun'),
                buildHeroIcon(context, 'images/ic_mercury.png', 'Mercury'),
                buildHeroIcon(context, 'images/ic_venus.png', 'Venus'),
                buildHeroIcon(context, 'images/ic_earth.png', 'Earth'),
                buildHeroIcon(context, 'images/ic_mars.png', 'Mars'),
                buildHeroIcon(context, 'images/ic_jupiter.png', 'Jupiter'),
                buildHeroIcon(context, 'images/ic_saturn.png', 'Saturn'),
                buildHeroIcon(context, 'images/ic_uranus.png', 'Uranus'),
                buildHeroIcon(context, 'images/ic_neptune.png', 'Neptune'),
                buildHeroIcon(context, 'images/ic_moon.png', 'Moon'),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            padding: new EdgeInsets.all(10.0),
            alignment: FractionalOffset.center,
          ),
        ),
      ],
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

class Star {
  // angle should be value 0.0 -> 1.0
  // left 0.0 -> 360.0
  // height 0.0 -> 640.0
  // typeFade 1 -> 4

  double left;
  double top;
  double extraSize;
  double angle;
  int typeFade;

  Star(
      {@required this.left,
      @required this.top,
      @required this.extraSize,
      @required this.angle,
      @required this.typeFade});
}
