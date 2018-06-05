import 'dart:async';

import 'package:demo_flutter/restaurant_animation/restaurant_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:meta/meta.dart';

class RestaurantAnimation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'RESTAURANT2',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new RestaurantAnimation()));
            }),
      ),
      body: new RestaurantAnimationScreen2(screenSize: MediaQuery.of(context).size),
    );
  }
}

class RestaurantAnimationScreen2 extends StatefulWidget {
  final Size screenSize;

  RestaurantAnimationScreen2({Key key, @required this.screenSize}) : super(key: key);

  @override
  State createState() => new RestaurantAnimationScreenState2();
}

class RestaurantAnimationScreenState2 extends State<RestaurantAnimationScreen2> with TickerProviderStateMixin {
  AnimationController animControlPhrase1, animControlPhrase2, animControlPhrase3;
  Animation moveIndicatorAnim,
      zoomIndicatorAnim,
      comeUpPlateAnim1,
      comeUpPlateAnim2,
      comeUpPlateAnim3,
      fadeInPlateAnim1,
      fadeInPlateAnim2,
      fadeInPlateAnim3,
      comeUpBtnBottomMenuAnim1,
      comeUpBtnBottomMenuAnim2,
      comeUpBtnBottomMenuAnim3,
      comeUpBtnBottomMenuAnim4,
      comeUpBtnBottomMenuAnim5,
      fadeInBtnBottomMenuAnim1,
      fadeInBtnBottomMenuAnim2,
      fadeInBtnBottomMenuAnim3,
      fadeInBtnBottomMenuAnim4,
      fadeInBtnBottomMenuAnim5,
      fadeInTextBottomMenuAnim;
  Animation zoomPlateAnim1, zoomPlateAnim2, fadeOutPlateAnim;

  double thresholdBtnBottomMenu1 = 40.0,
      thresholdBtnBottomMenu2 = 50.0,
      thresholdSizeBtnPlate1 = 10.0,
      thresholdSizeBtnPlate2 = 30.0;
  bool isBtnPlatePressed = false, isCircleAddPressed = false;

  int quantity = 1;

  Size screenSize;
  double marginEdgeTopMenu, marginMiddleTopMenu;
  double sizeItemTopMenu = 90.0;
  double sizeIconTopMenu = 15.0;

  @override
  void initState() {
    super.initState();

    screenSize = widget.screenSize;
    marginEdgeTopMenu = (screenSize.width - (sizeItemTopMenu * 3)) / 3;
    marginMiddleTopMenu = marginEdgeTopMenu / 2;

    // Animation phrase 1
    animControlPhrase1 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1200));

    moveIndicatorAnim = new Tween(
            begin: screenSize.width - sizeItemTopMenu - marginEdgeTopMenu - 10.0,
            end: marginEdgeTopMenu + sizeItemTopMenu + marginMiddleTopMenu - 13.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.4)));
    moveIndicatorAnim.addListener(() {
      setState(() {});
    });
    zoomIndicatorAnim = new Tween(begin: 20.0, end: 50.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.5)));
    zoomIndicatorAnim.addListener(() {
      setState(() {});
    });

    comeUpPlateAnim1 = new Tween(begin: 0.0, end: 20.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.7)));
    comeUpPlateAnim1.addListener(() {
      setState(() {});
    });
    comeUpPlateAnim2 = new Tween(begin: 0.0, end: 40.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.8)));
    comeUpPlateAnim2.addListener(() {
      setState(() {});
    });
    comeUpPlateAnim3 = new Tween(begin: 0.0, end: 20.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.4, 1.0)));
    comeUpPlateAnim3.addListener(() {
      setState(() {});
    });

    fadeInPlateAnim1 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.5)));
    fadeInPlateAnim1.addListener(() {
      setState(() {});
    });

    fadeInPlateAnim2 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.6)));
    fadeInPlateAnim2.addListener(() {
      setState(() {});
    });

    fadeInPlateAnim3 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.4, 1.0)));
    fadeInPlateAnim3.addListener(() {
      setState(() {});
    });

    comeUpBtnBottomMenuAnim1 = new Tween(begin: 0.0, end: 60.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.4, 0.8)));
    comeUpBtnBottomMenuAnim1.addListener(() {
      setState(() {});
    });
    comeUpBtnBottomMenuAnim2 = new Tween(begin: 0.0, end: 60.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.35, 0.75)));
    comeUpBtnBottomMenuAnim2.addListener(() {
      setState(() {});
    });
    comeUpBtnBottomMenuAnim3 = new Tween(begin: 0.0, end: 60.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.4, 0.8)));
    comeUpBtnBottomMenuAnim3.addListener(() {
      setState(() {});
    });
    comeUpBtnBottomMenuAnim4 = new Tween(begin: 0.0, end: 60.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.45, 0.85)));
    comeUpBtnBottomMenuAnim4.addListener(() {
      setState(() {});
    });
    comeUpBtnBottomMenuAnim5 = new Tween(begin: 0.0, end: 60.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.5, 0.9)));
    comeUpBtnBottomMenuAnim5.addListener(() {
      setState(() {});
    });

    fadeInTextBottomMenuAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.4, 0.7)));
    fadeInTextBottomMenuAnim.addListener(() {
      setState(() {});
    });

    fadeInBtnBottomMenuAnim1 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.5)));
    fadeInBtnBottomMenuAnim1.addListener(() {
      setState(() {});
    });
    fadeInBtnBottomMenuAnim2 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.5)));
    fadeInBtnBottomMenuAnim2.addListener(() {
      setState(() {});
    });
    fadeInBtnBottomMenuAnim3 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.5)));
    fadeInBtnBottomMenuAnim3.addListener(() {
      setState(() {});
    });
    fadeInBtnBottomMenuAnim4 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.5)));
    fadeInBtnBottomMenuAnim4.addListener(() {
      setState(() {});
    });
    fadeInBtnBottomMenuAnim5 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.5)));
    fadeInBtnBottomMenuAnim5.addListener(() {
      setState(() {});
    });

    animControlPhrase1.forward();

    // Animation phrase 2
    animControlPhrase2 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 600));
    fadeOutPlateAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.0, 1.0)));
    fadeOutPlateAnim.addListener(() {
      setState(() {});
    });
    zoomPlateAnim1 = new Tween(begin: 0.0, end: 40.0)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.0, 1.0)));
    zoomPlateAnim1.addListener(() {
      setState(() {});
    });

    // Animation phrase 3
    animControlPhrase3 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 600));
    zoomPlateAnim2 = new Tween(begin: 0.0, end: 40.0)
        .animate(new CurvedAnimation(parent: animControlPhrase3, curve: new Interval(0.0, 1.0)));
    zoomPlateAnim2.addListener(() {
      setState(() {});
    });
    zoomPlateAnim2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isCircleAddPressed = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animControlPhrase1.dispose();
    animControlPhrase2.dispose();
    animControlPhrase3.dispose();
  }

  Future<bool> onWillPopScope() {
    Navigator.pop(context);
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new RestaurantAnimation()));
    return new Future.value(false);
  }

  double processMarginBottomMenu(double value) {
    if (value < thresholdBtnBottomMenu1) {
      return value;
    } else if (value < thresholdBtnBottomMenu2) {
      return value = thresholdBtnBottomMenu1 - (value - thresholdBtnBottomMenu1);
    } else {
      return value = 80 - thresholdBtnBottomMenu2 + (value - thresholdBtnBottomMenu2);
    }
  }

  Widget renderTabMenu() {
    return new Container(
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            foregroundPainter: new TabIndicatorPainter(moveIndicatorAnim.value, zoomIndicatorAnim.value),
          ),
          new Row(
            children: <Widget>[
              // Dashboard
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Image.asset('images/ic_home.png', width: sizeIconTopMenu, height: sizeIconTopMenu),
                    new Container(width: 10.0),
                    new Text('Dashboard',
                        style: new TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12.0))
                  ],
                ),
                width: sizeItemTopMenu,
              ),

              // Menus
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Image.asset(
                      'images/ic_menu.png',
                      width: sizeIconTopMenu,
                      height: sizeIconTopMenu,
                      color: moveIndicatorAnim.value == marginEdgeTopMenu + sizeItemTopMenu + marginMiddleTopMenu - 13.0
                          ? new Color(0xFFf53970)
                          : Colors.white,
                    ),
                    new Container(width: 10.0),
                    new Text('Menus',
                        style: new TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12.0))
                  ],
                ),
                width: sizeItemTopMenu,
              ),

              // Seats
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Image.asset('images/ic_seat.png',
                        width: sizeIconTopMenu,
                        height: sizeIconTopMenu,
                        color: moveIndicatorAnim.value == screenSize.width - sizeItemTopMenu - marginEdgeTopMenu - 10.0
                            ? new Color(0xFFf53970)
                            : Colors.white),
                    new Container(width: 10.0),
                    new Text('Seats Plan',
                        style: new TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12.0))
                  ],
                ),
                width: sizeItemTopMenu,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
      ),
      decoration: new BoxDecoration(color: new Color(0xFFf53970)),
      padding: new EdgeInsets.all(10.0),
      height: 40.0,
    );
  }

  Widget renderBodyContent() {
    return new Positioned(
        top: 50.0,
        left: 0.0,
        right: 0.0,
        child: new Container(
          child: new Stack(
            children: <Widget>[
              renderPlateLine1(),
              renderPlateLine2(),
              renderPlateLine3(),
            ],
          ),
        ));
  }

  Widget renderPlateLine1() {
    double value = 0.0;
    if (isBtnPlatePressed) {
      value = processSizeBtnTable(zoomPlateAnim1.value);
    }

    double value2 = 0.0;
    if (isCircleAddPressed) {
      value = processSizeBtnTable(zoomPlateAnim2.value);
    }

    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Plate 1
          new Opacity(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          child: new FlatButton(
                            onPressed: !isBtnPlatePressed ? onBtnPlatePressed : null,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            padding: new EdgeInsets.all(0.0),
                            child: new Stack(
                              children: <Widget>[
                                // Photo food
                                new Center(
                                  child: new Image.asset(
                                    'images/flan.png',
                                    width: 130.0 - value,
                                    height: 130.0 - value,
                                  ),
                                ),

                                // Photo white circle cover
                                new Opacity(
                                  child: new Stack(
                                    children: <Widget>[
                                      new Center(
                                        child: new Image.asset(
                                          'images/ic_white_circle.png',
                                          width: isBtnPlatePressed ? 130.0 - value : 130.0 - value2,
                                          height: isBtnPlatePressed ? 130.0 - value : 130.0 - value2,
                                        ),
                                      ),
                                      new Center(
                                        child: new Container(
                                          child: new Row(
                                            children: <Widget>[
                                              new GestureDetector(
                                                child: new Image.asset(
                                                  'images/ic_remove_circle.png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                ),
                                                onTapDown: (tapDownDetail) {},
                                              ),
                                              new Text(
                                                quantity.toString(),
                                                style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                              ),
                                              new GestureDetector(
                                                child: new Image.asset(
                                                  'images/ic_add_circle.png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                ),
                                                onTapDown: onCircleAddPressed,
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          ),
                                          height: 130.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  opacity: fadeOutPlateAnim.value,
                                )
                              ],
                            ),
                          ),
                          width: 140.0,
                          height: 140.0,
                        ),

                        // Icon price
                        new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Image.asset(
                                'images/ic_red_circle.png',
                                width: isBtnPlatePressed ? 40.0 - value / 2 : 40.0 - value2 / 2,
                                height: isBtnPlatePressed ? 40.0 - value / 2 : 40.0 - value2 / 2,
                              ),
                              new Positioned(
                                child: new Text(
                                  '\$16',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isBtnPlatePressed ? 10.0 - value / 4 : 10.0 - value2 / 4,
                                      color: Colors.white),
                                ),
                                right: 10.0,
                                top: 10.0,
                              )
                            ],
                          ),
                          right: isBtnPlatePressed ? 10.0 + value / 2 : 10.0 + value2 / 2,
                          top: isBtnPlatePressed ? value / 2 : value2 / 2,
                        )
                      ],
                    ),
                    margin: new EdgeInsets.only(bottom: 5.0),
                  ),
                  new Text('Flan',
                      style: new TextStyle(
                        color: new Color(0xFF575869),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              margin: new EdgeInsets.only(bottom: 20.0 + comeUpPlateAnim1.value),
              height: 180.0,
            ),
            opacity: fadeInPlateAnim1.value,
          ),

          // Plate 2
          new Opacity(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          child: new FlatButton(
                            onPressed: () {},
                            padding: new EdgeInsets.all(0.0),
                            child: new Image.asset(
                              'images/curry.png',
                              width: 130.0,
                              height: 130.0,
                            ),
                          ),
                          width: 140.0,
                          height: 140.0,
                        ),
                        new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Image.asset(
                                'images/ic_red_circle.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                              new Positioned(
                                child: new Text(
                                  '\$22',
                                  style:
                                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),
                                ),
                                right: 10.0,
                                top: 10.0,
                              )
                            ],
                          ),
                          right: 10.0,
                        )
                      ],
                    ),
                    margin: new EdgeInsets.only(bottom: 5.0),
                  ),
                  new Text('Chicken Curry',
                      style: new TextStyle(
                        color: new Color(0xFF575869),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim2.value),
              height: 180.0,
            ),
            opacity: fadeInPlateAnim2.value,
          )
        ],
      ),
      height: 220.0,
    );
  }

  Widget renderPlateLine2() {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Plate 3
          new Opacity(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Stack(
                      children: <Widget>[
                        new FlatButton(
                          onPressed: () {},
                          padding: new EdgeInsets.all(0.0),
                          child: new Image.asset(
                            'images/salad.png',
                            width: 130.0,
                            height: 130.0,
                          ),
                        ),
                        new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Image.asset(
                                'images/ic_red_circle.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                              new Positioned(
                                child: new Text(
                                  '\$13',
                                  style:
                                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),
                                ),
                                right: 10.0,
                                top: 10.0,
                              )
                            ],
                          ),
                          right: 0.0,
                        )
                      ],
                    ),
                    margin: new EdgeInsets.only(bottom: 5.0),
                  ),
                  new Text('Salmon Salad',
                      style: new TextStyle(
                        color: new Color(0xFF575869),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim3.value),
              height: 160.0,
//                                  decoration: new BoxDecoration(color: Colors.cyan),
            ),
            opacity: fadeInPlateAnim3.value,
          ),

          // Plate 4
          new Opacity(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Stack(
                      children: <Widget>[
                        new FlatButton(
                          onPressed: () {},
                          padding: new EdgeInsets.all(0.0),
                          child: new Image.asset(
                            'images/pizza.png',
                            width: 130.0,
                            height: 130.0,
                          ),
                        ),
                        new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Image.asset(
                                'images/ic_red_circle.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                              new Positioned(
                                child: new Text(
                                  '\$25',
                                  style:
                                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),
                                ),
                                right: 10.0,
                                top: 10.0,
                              )
                            ],
                          ),
                          right: 0.0,
                        )
                      ],
                    ),
                    margin: new EdgeInsets.only(bottom: 5.0),
                  ),
                  new Text('Pizza',
                      style: new TextStyle(
                        color: new Color(0xFF575869),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim3.value),
              height: 160.0,
//                                  decoration: new BoxDecoration(color: Colors.cyan),
            ),
            opacity: fadeInPlateAnim3.value,
          )
        ],
      ),
      height: 200.0,
      margin: new EdgeInsets.only(top: 170.0),
    );
  }

  Widget renderPlateLine3() {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Plate 5
          new Opacity(
            child: new Container(
              child: new Stack(
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.all(0.0),
                    child: new Image.asset(
                      'images/chicken.png',
                      width: 130.0,
                      height: 130.0,
                    ),
                  ),
                  new Positioned(
                    child: new Stack(
                      children: <Widget>[
                        new Image.asset(
                          'images/ic_red_circle.png',
                          width: 40.0,
                          height: 40.0,
                        ),
                        new Positioned(
                          child: new Text(
                            '\$20',
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),
                          ),
                          right: 10.0,
                          top: 10.0,
                        )
                      ],
                    ),
                    right: 0.0,
                  )
                ],
              ),
              margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim3.value),
            ),
            opacity: fadeInPlateAnim3.value,
          ),

          // Plate 6
          new Opacity(
            child: new Container(
              child: new Stack(
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.all(0.0),
                    child: new Image.asset(
                      'images/salad.png',
                      width: 130.0,
                      height: 130.0,
                    ),
                  ),
                  new Positioned(
                    child: new Stack(
                      children: <Widget>[
                        new Image.asset(
                          'images/ic_red_circle.png',
                          width: 40.0,
                          height: 40.0,
                        ),
                        new Positioned(
                          child: new Text(
                            '\$11',
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),
                          ),
                          right: 10.0,
                          top: 10.0,
                        )
                      ],
                    ),
                    right: 0.0,
                  )
                ],
              ),
              margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim3.value),
            ),
            opacity: fadeInPlateAnim3.value,
          )
        ],
      ),
      height: 150.0,
      margin: new EdgeInsets.only(top: 350.0),
    );
  }

  Widget renderBtnBottomMenu() {
    double value1 = 0.0, value2 = 0.0, value3 = 0.0, value4 = 0.0, value5 = 0.0;
    value1 = processMarginBottomMenu(comeUpBtnBottomMenuAnim1.value);
    value2 = processMarginBottomMenu(comeUpBtnBottomMenuAnim2.value);
    value3 = processMarginBottomMenu(comeUpBtnBottomMenuAnim3.value);
    value4 = processMarginBottomMenu(comeUpBtnBottomMenuAnim4.value);
    value5 = processMarginBottomMenu(comeUpBtnBottomMenuAnim5.value);

    return new Container(
      child: new Row(
        children: <Widget>[
          new Opacity(
            child: new Container(
              child: new RawMaterialButton(
                onPressed: () {},
                child: new Image.asset(
                  'images/ic_restaurant.png',
                  width: 40.0,
                  height: 40.0,
                ),
                constraints: new BoxConstraints(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              margin: new EdgeInsets.only(bottom: value1),
              width: 40.0,
              height: 40.0,
            ),
            opacity: fadeInBtnBottomMenuAnim1.value,
          ),
          new Opacity(
            child: new Container(
              child: new RawMaterialButton(
                onPressed: () {},
                child: new Image.asset(
                  'images/ic_cake.png',
                  width: 40.0,
                  height: 40.0,
                ),
                constraints: new BoxConstraints(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              margin: new EdgeInsets.only(bottom: value2),
              width: 40.0,
              height: 40.0,
            ),
            opacity: fadeInBtnBottomMenuAnim2.value,
          ),
          new Opacity(
            child: new Container(
              child: new RawMaterialButton(
                onPressed: () {},
                child: new Image.asset(
                  'images/ic_car.png',
                  width: 40.0,
                  height: 40.0,
                ),
                constraints: new BoxConstraints(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              margin: new EdgeInsets.only(bottom: value3),
              width: 40.0,
              height: 40.0,
            ),
            opacity: fadeInBtnBottomMenuAnim3.value,
          ),
          new Opacity(
            child: new Container(
              child: new RawMaterialButton(
                onPressed: () {},
                child: new Image.asset(
                  'images/ic_coffee.png',
                  width: 40.0,
                  height: 40.0,
                ),
                constraints: new BoxConstraints(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              margin: new EdgeInsets.only(bottom: value4),
              width: 40.0,
              height: 40.0,
            ),
            opacity: fadeInBtnBottomMenuAnim4.value,
          ),
          new Opacity(
            child: new Container(
              child: new RawMaterialButton(
                onPressed: () {},
                child: new Image.asset(
                  'images/ic_cook.png',
                  width: 40.0,
                  height: 40.0,
                ),
                constraints: new BoxConstraints(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              margin: new EdgeInsets.only(bottom: value5),
              width: 40.0,
              height: 40.0,
            ),
            opacity: fadeInBtnBottomMenuAnim5.value,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
      height: 100.0,
      margin: new EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
    );
  }

  Widget renderTextBottomMenu() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(
              'Appetizer',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Salad',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Soup',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Meat',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Fish',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      margin: new EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
      height: 20.0,
    );
  }

  void onBtnPlatePressed() {
    isBtnPlatePressed = true;
    animControlPhrase2.forward();
  }

  void onCircleAddPressed(tapDownDetails) {
    quantity++;
    isCircleAddPressed = true;
    animControlPhrase3.forward();
  }

  double processSizeBtnTable(double value) {
    if (value < 10.0) {
      return value;
    } else if (value < thresholdSizeBtnPlate2) {
      return value = thresholdSizeBtnPlate2 - thresholdSizeBtnPlate1 - value;
    } else {
      return value = value - (thresholdSizeBtnPlate2 + thresholdSizeBtnPlate1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Container(
          width: double.infinity,
          height: double.infinity,
          child: new Stack(
            children: <Widget>[
              // Tab menu
              renderTabMenu(),

              // Body content
              renderBodyContent(),

              // Cover color
              new Positioned(
                child: new Image.asset(
                  'images/shadow_white.png',
                  width: double.infinity,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
              ),

              // Button bottom menu
              new Positioned(
                child: renderBtnBottomMenu(),
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
              ),

              // Text bottom menu
              new Positioned(
                child: new Opacity(opacity: fadeInTextBottomMenuAnim.value, child: renderTextBottomMenu()),
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
              ),
            ],
          ),
        ),
        onWillPop: onWillPopScope);
  }
}

class TabIndicatorPainter extends CustomPainter {
  Paint painter;
  double xPos, radiusOval;

  double radiusOvalOrigin = 20.0;

  TabIndicatorPainter(double xPos, double radiusOval) {
    painter = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    this.xPos = xPos;
    this.radiusOval = radiusOval;
  }

  double processRadiusOval(double value) {
    if (value <= 30.0) {
      return value;
    } else if (value <= 40.0) {
      return value = radiusOvalOrigin + (40.0 - value);
    } else if (value <= 45) {
      return value = radiusOvalOrigin + (value - 40.0);
    } else {
      return value = radiusOvalOrigin + (50.0 - value);
    }
  }

  double processRadiusOval2(double value) {
    if (value <= 40.0) {
      return 0.0;
    } else if (value <= 45.0) {
      return value = value - 40.0;
    } else {
      return value = (50.0 - value);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
        new Rect.fromLTRB(xPos - processRadiusOval2(radiusOval), 0.0, xPos + processRadiusOval(radiusOval), 20.0),
        painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
