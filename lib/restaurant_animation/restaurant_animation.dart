import 'package:demo_flutter/restaurant_animation/restaurant_animation2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

class RestaurantAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'RESTAURANT',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new RestaurantAnimationScreen(),
    );
  }
}

class RestaurantAnimationScreen extends StatefulWidget {
  @override
  State createState() => new RestaurantAnimationScreenState();
}

class RestaurantAnimationScreenState extends State<RestaurantAnimationScreen> with TickerProviderStateMixin {
  AnimationController animControlPhrase1, animControlPhrase2, animControlPhrase3;
  Animation dropDownAnim,
      fadeInViewAnim,
      zoomBtnTableAnim,
      fadeOutViewAnim,
      fadeOutTextAnimation,
      fadeInBtnBottomMenuAnim,
      comeUpBtnBottomMenuAnim1,
      comeUpBtnBottomMenuAnim2,
      comeUpBtnBottomMenuAnim3,
      comeUpBtnBottomMenuAnim4,
      comeUpTextBottomMenuAnim,
      fadeInTextBottomMenuAnim,
      zoomBtnBottomMenuAnim;

  double thresholdMarginTop1 = 40.0,
      thresholdMarginTop2 = 60.0,
      thresholdSizeBtnBigTable1 = 10.0,
      thresholdSizeBtnBigTable2 = 30.0,
      thresholdBtnBottomMenu1 = 40.0,
      thresholdBtnBottomMenu2 = 60.0;

  bool isBtnTablePressed = false;
  int whichBtnTablePressed = 0;
  int whichBtnMenuPressed = 0;
  bool isBtnBottomMenuPressed = false;

  @override
  void initState() {
    super.initState();

    // Animation phrase 1 (drop down view with bounce)
    animControlPhrase1 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1200));
    dropDownAnim = new Tween(begin: 0.0, end: 70.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 1.0, curve: Curves.easeOut)));
    dropDownAnim.addListener(() {
      setState(() {});
    });
    fadeInViewAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.8, curve: Curves.easeOut)));
    fadeInViewAnim.addListener(() {
      setState(() {});
    });

    animControlPhrase1.forward();

    // Animation phrase 2 (zoom button when be pressed and show up bottom menu)
    animControlPhrase2 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1000));

    zoomBtnTableAnim = new Tween(begin: 0.0, end: 40.0)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: Curves.easeOut));
    zoomBtnTableAnim.addListener(() {
      setState(() {});
    });

    fadeOutViewAnim = new Tween(begin: 1.0, end: 0.2)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.2, 0.6)));
    fadeOutViewAnim.addListener(() {
      setState(() {});
    });

    fadeOutTextAnimation = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.2, 0.6)));
    fadeOutTextAnimation.addListener(() {
      setState(() {});
    });

    fadeInBtnBottomMenuAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.3, 0.5)));
    fadeInBtnBottomMenuAnim.addListener(() {
      setState(() {});
    });

    comeUpBtnBottomMenuAnim1 = new Tween(begin: 0.0, end: 80.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.3, 0.7, curve: Curves.decelerate)));
    comeUpBtnBottomMenuAnim1.addListener(() {
      setState(() {});
    });

    comeUpBtnBottomMenuAnim2 = new Tween(begin: 0.0, end: 80.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.35, 0.75, curve: Curves.decelerate)));
    comeUpBtnBottomMenuAnim2.addListener(() {
      setState(() {});
    });

    comeUpBtnBottomMenuAnim3 = new Tween(begin: 0.0, end: 80.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.4, 0.8, curve: Curves.decelerate)));
    comeUpBtnBottomMenuAnim3.addListener(() {
      setState(() {});
    });

    comeUpBtnBottomMenuAnim4 = new Tween(begin: 0.0, end: 80.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.45, 0.85, curve: Curves.decelerate)));
    comeUpBtnBottomMenuAnim4.addListener(() {
      setState(() {});
    });

    comeUpTextBottomMenuAnim = new Tween(begin: 0.0, end: 25.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.45, 0.85, curve: Curves.decelerate)));
    comeUpTextBottomMenuAnim.addListener(() {
      setState(() {});
    });

    fadeInTextBottomMenuAnim = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.3, 1.0)));
    fadeInTextBottomMenuAnim.addListener(() {
      setState(() {});
    });

    // Animation phrase 3 (zoom button bottom menu)
    animControlPhrase3 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 300));
    animControlPhrase3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateNextScreen();
      }
    });
    zoomBtnBottomMenuAnim = new Tween(begin: 0.0, end: 8.0).animate(animControlPhrase3);
    zoomBtnBottomMenuAnim.addListener(() {
      setState(() {});
    });
  }

  // Process value for margin top with bounce for body content
  double processMarginBodyContent(double value) {
    if (value < thresholdMarginTop1) {
      return value;
    } else if (value < thresholdMarginTop2) {
      return value = thresholdMarginTop1 - (value - thresholdMarginTop1);
    } else {
      return value = value - thresholdMarginTop1;
    }
  }

  // Process size button, zoom out -> zoom in -> zoom out
  double processSizeBtnBigTable(double value) {
    if (value < 10.0) {
      return value;
    } else if (value < thresholdSizeBtnBigTable2) {
      return value = thresholdSizeBtnBigTable2 - thresholdSizeBtnBigTable1 - value;
    } else {
      return value = value - (thresholdSizeBtnBigTable2 + thresholdSizeBtnBigTable1);
    }
  }

  double processMarginBottomMenu(double value) {
    if (value < thresholdBtnBottomMenu1) {
      return value;
    } else if (value < thresholdBtnBottomMenu2) {
      return value = thresholdBtnBottomMenu1 - (value - thresholdBtnBottomMenu1);
    } else {
      return value = value - thresholdBtnBottomMenu1;
    }
  }

  @override
  void dispose() {
    animControlPhrase1.dispose();
    animControlPhrase2.dispose();
    animControlPhrase3.dispose();
    super.dispose();
  }

  void onBtnTablePressed(int whichTable) {
    isBtnTablePressed = true;
    whichBtnTablePressed = whichTable;
    animControlPhrase2.forward();
  }

  void onBtnBottomMenuPressed(int whichBtn) {
    isBtnBottomMenuPressed = true;
    whichBtnMenuPressed = whichBtn;
    animControlPhrase3.forward();
  }

  void onCancelPressed() {
    isBtnTablePressed = false;
    whichBtnTablePressed = 0;
    animControlPhrase2.reverse();
  }

  void navigateNextScreen() {
    Navigator.pop(context);
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new RestaurantAnimation2()));
  }

  Widget renderTabMenu() {
    return new Container(
      child: new Row(
        children: <Widget>[
          // Dashboard
          new FlatButton(
            child: new Row(
              children: <Widget>[
                new Image.asset('images/ic_home.png', width: 15.0, height: 15.0),
                new Container(width: 10.0),
                new Text('Dashboard', style: new TextStyle(color: Colors.white))
              ],
            ),
            onPressed: () {},
          ),

          // Menus
          new FlatButton(
            child: new Row(
              children: <Widget>[
                new Image.asset('images/ic_menu.png', width: 15.0, height: 15.0),
                new Container(width: 10.0),
                new Text('Menus', style: new TextStyle(color: Colors.white))
              ],
            ),
            onPressed: () {},
          ),

          // Seats
          new FlatButton(
            child: new Row(
              children: <Widget>[
                new Image.asset('images/ic_seat.png', width: 15.0, height: 15.0),
                new Container(width: 10.0),
                new Text('Seats', style: new TextStyle(color: Colors.white))
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      decoration: new BoxDecoration(color: new Color(0xFFf53970)),
      padding: new EdgeInsets.all(10.0),
      height: 40.0,
    );
  }

  Widget renderBtnBottomMenu() {
    double value1 = 0.0, value2 = 0.0, value3 = 0.0, value4 = 0.0;
    if (isBtnTablePressed) {
      value1 = processMarginBottomMenu(comeUpBtnBottomMenuAnim1.value);
      value2 = processMarginBottomMenu(comeUpBtnBottomMenuAnim2.value);
      value3 = processMarginBottomMenu(comeUpBtnBottomMenuAnim3.value);
      value4 = processMarginBottomMenu(comeUpBtnBottomMenuAnim4.value);
    }

    double extraSizeBtnBottomMenu = 0.0;
    if (isBtnBottomMenuPressed) {
      extraSizeBtnBottomMenu = extraSizeBtnBottomMenu + zoomBtnBottomMenuAnim.value;
    }

    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new RawMaterialButton(
              onPressed: () => onBtnBottomMenuPressed(1),
              child: new Image.asset(
                'images/ic_book.png',
                width: whichBtnMenuPressed == 1 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
                height: whichBtnMenuPressed == 1 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value1),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
            child: new RawMaterialButton(
              onPressed: () => onBtnBottomMenuPressed(2),
              child: new Image.asset(
                'images/ic_add.png',
                width: whichBtnMenuPressed == 2 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
                height: whichBtnMenuPressed == 2 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value2),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
            child: new RawMaterialButton(
              onPressed: () => onBtnBottomMenuPressed(3),
              child: new Image.asset(
                'images/ic_clock.png',
                width: whichBtnMenuPressed == 3 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
                height: whichBtnMenuPressed == 3 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value3),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
            child: new RawMaterialButton(
              onPressed: onCancelPressed,
              child: new Image.asset(
                'images/ic_cancel.png',
                width: whichBtnMenuPressed == 4 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
                height: whichBtnMenuPressed == 4 ? 40.0 - extraSizeBtnBottomMenu : 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value4),
            width: 40.0,
            height: 40.0,
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
              'Book',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Order',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Reservation',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Cancel',
              style: new TextStyle(color: new Color(0xFF575869), fontSize: 11.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      margin: new EdgeInsets.only(left: 25.0, right: 25.0, bottom: comeUpTextBottomMenuAnim.value),
      height: 20.0,
    );
  }

  // With press animation for demo
  Widget renderBigTable(String colorTable, int whichTable, Function onPressed) {
    double value = 0.0;
    if (isBtnTablePressed && whichBtnTablePressed == whichTable) {
      value = processSizeBtnBigTable(zoomBtnTableAnim.value);
    }

    return new FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: new Container(
        width: 120.0 - value,
        height: 100.0 - value,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Image.asset('images/chair_top.png', width: 40.0 - value / 2.0, height: 20.0 - value / 4.0),
                  new Expanded(child: new Container()),
                  new Image.asset('images/chair_top.png', width: 40.0 - value / 2.0, height: 20.0 - value / 4.0),
                ],
              ),
              width: 90.0 - value,
            ),
            new Stack(
              children: <Widget>[
                new Image.asset(
                  colorTable == 'green' ? 'images/table_big_green.png' : 'images/table_big_pink.png',
                  width: 120.0 - value,
                  height: 60.0 - value / 2.0,
                  fit: BoxFit.contain,
                  color: (isBtnTablePressed && whichBtnTablePressed == whichTable)
                      ? colorTable == 'green' ? new Color(0xff7DD5AF) : new Color(0xFFF8859B)
                      : null,
                ),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        '01',
                        style: new TextStyle(
                            color: (isBtnTablePressed && whichBtnTablePressed == whichTable)
                                ? Colors.white
                                : new Color(0xFF575869),
                            fontSize: 14.0 - value / 4.0),
                      ),
                      new Container(height: 15.0 - value / 4.0),
                      new Text(
                        'Available',
                        style: new TextStyle(
                            color: (isBtnTablePressed && whichBtnTablePressed == whichTable)
                                ? Colors.white
                                : new Color(0xFF575869),
                            fontSize: 10.0 - value / 4.0),
                      )
                    ],
                  ),
                  margin: new EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0, right: 10.0),
                )
              ],
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Image.asset('images/chair_bottom.png', width: 40.0 - value / 2.0, height: 20.0 - value / 4.0),
                  new Expanded(child: new Container()),
                  new Image.asset('images/chair_bottom.png', width: 40.0 - value / 2.0, height: 20.0 - value / 4.0),
                ],
              ),
              width: 90.0 - value,
            ),
          ],
        ),
      ),
      padding: new EdgeInsets.all(0.0),
    );
  }

  Widget renderSmallTable(String colorTable, int whichTable, Function onPressed) {
    double value = 0.0;
    if (isBtnTablePressed && whichBtnTablePressed == whichTable) {
      value = processSizeBtnBigTable(zoomBtnTableAnim.value);
    }

    return new FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: new Container(
        width: 60.0 - value,
        height: 100.0 - value,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              'images/chair_top.png',
              width: 40.0 - value / 2.0,
              height: 20.0 - value / 4.0,
            ),
            new Stack(
              children: <Widget>[
                new Image.asset(
                  colorTable == 'green' ? 'images/table_small_green.png' : 'images/table_small_yellow.png',
                  width: 70.0 - value / 2.0,
                  height: 50.0 - value / 2.0,
                  fit: BoxFit.contain,
                  color: (isBtnTablePressed && whichBtnTablePressed == whichTable)
                      ? colorTable == 'green' ? new Color(0xff7DD5AF) : new Color(0xFFFBDB75)
                      : null,
                ),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('01',
                          style: new TextStyle(
                              color: (isBtnTablePressed && whichBtnTablePressed == whichTable)
                                  ? Colors.white
                                  : new Color(0xFF575869),
                              fontSize: 14.0 - value / 4.0)),
                      new Container(
                        height: 15.0,
                      ),
                      new Text(
                        'Taken',
                        style: new TextStyle(
                            color: (isBtnTablePressed && whichBtnTablePressed == whichTable)
                                ? Colors.white
                                : new Color(0xFF575869),
                            fontSize: 10.0 - value / 4.0),
                      )
                    ],
                  ),
                  margin: new EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                )
              ],
            ),
            new Image.asset(
              'images/chair_bottom.png',
              width: 40.0 - value / 2.0,
              height: 20.0 - value / 4.0,
            ),
          ],
        ),
      ),
      padding: new EdgeInsets.all(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: new BoxDecoration(color: new Color(0xfff8f9fb)),
      child: new Stack(
        children: <Widget>[
          // Tab menu
          renderTabMenu(),

          // Body content
          new Positioned(
            top: 40.0 + processMarginBodyContent(dropDownAnim.value),
            left: 0.0,
            right: 0.0,
            child: new Opacity(
              opacity: fadeInViewAnim.value,
              child: new Column(
                children: <Widget>[
                  // Text "entrance"
                  new Center(
                    child: new Opacity(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                        child: new Text(
                          'ENTRANCE',
                          style: new TextStyle(
                            color: new Color(0xFF575869),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      opacity: fadeOutTextAnimation.value,
                    ),
                  ),

                  // Group tables
                  new Column(
                    children: <Widget>[
                      // Group table on row 1
                      new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Opacity(
                              child: new Container(
                                child: renderBigTable('green', 1, () => onBtnTablePressed(1)),
                                height: 120.0,
                                width: 120.0,
                              ),
                              opacity: whichBtnTablePressed != 1 ? fadeOutViewAnim.value : 1.0,
                            ),
                            new Opacity(
                              child: new Container(
                                child: renderBigTable('pink', 2, () => onBtnTablePressed(2)),
                                height: 120.0,
                                width: 120.0,
                              ),
                              opacity: whichBtnTablePressed != 2 ? fadeOutViewAnim.value : 1.0,
                            ),
                          ],
                        ),
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 120.0,
                      ),

                      // Group table on row 2
                      new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Opacity(
                              child: renderSmallTable('yellow', 3, () => onBtnTablePressed(3)),
                              opacity: whichBtnTablePressed != 3 ? fadeOutViewAnim.value : 1.0,
                            ),
                            new Opacity(
                              child: renderSmallTable('green', 4, () => onBtnTablePressed(4)),
                              opacity: whichBtnTablePressed != 4 ? fadeOutViewAnim.value : 1.0,
                            ),
                            new Opacity(
                              child: renderSmallTable('green', 5, () => onBtnTablePressed(5)),
                              opacity: whichBtnTablePressed != 5 ? fadeOutViewAnim.value : 1.0,
                            ),
                          ],
                        ),
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 120.0,
                      ),

                      // Group table on row 3
                      new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Opacity(
                              child: new Container(
                                child: renderBigTable('pink', 6, () => onBtnTablePressed(6)),
                                height: 120.0,
                                width: 120.0,
                              ),
                              opacity: whichBtnTablePressed != 6 ? fadeOutViewAnim.value : 1.0,
                            ),
                            new Opacity(
                              child: new Container(
                                child: renderBigTable('green', 7, () => onBtnTablePressed(7)),
                                height: 120.0,
                                width: 120.0,
                              ),
                              opacity: whichBtnTablePressed != 7 ? fadeOutViewAnim.value : 1.0,
                            ),
                          ],
                        ),
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 120.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Button bottom menu
          new Positioned(
            child: new Opacity(opacity: fadeInBtnBottomMenuAnim.value, child: renderBtnBottomMenu()),
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
    );
  }
}
