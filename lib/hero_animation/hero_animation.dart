import 'dart:math';

import 'package:demo_flutter/hero_animation/hero_animation2.dart';
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
  static const double slowMode = 1.0;

  AnimationController animControl;
  Animation fadeAnim1, fadeAnim2, fadeAnim3, fadeAnim4, sizeAnim, rotateAnim;
  Size screenSize;
  List<Star> listStar;
  int numStars;

  RectTween createRectTween(Rect begin, Rect end) {
    return new MaterialRectArcTween(begin: begin, end: end);
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
              Navigator.of(context).push(new PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return new AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) => new HeroAnimation2(imageName, description, animation, slowMode));
                },
              ));
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
    List<Widget> list = new List();
    for (int i = 0; i < numStars; i++) {
      list.add(
          buildStar(listStar[i].left, listStar[i].top, listStar[i].extraSize, listStar[i].angle, listStar[i].typeFade));
    }

    return new Stack(
      children: <Widget>[
        list[0],
        list[1],
        list[2],
        list[3],
        list[4],
        list[5],
        list[6],
        list[7],
        list[8],
        list[9],
        list[10],
        list[11],
        list[12],
        list[13],
        list[14],
        list[15],
        list[16],
        list[17],
        list[18],
        list[19],
        list[20],
        list[21],
        list[22],
        list[23],
        list[24],
        list[25],
        list[26],
        list[27],
        list[28],
        list[29],
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    screenSize = widget.screenSize;
    listStar = new List();
    numStars = 30;

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
    timeDilation = slowMode;

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
