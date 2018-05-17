import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class RestaurantAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RESTAURANT"),
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

  AnimationController animControlPhrase1, animControlPhrase2;
  Animation dropDownAnimation, fadeInViewAnimation,
      zoomBtnAnimation, fadeOutViewAnimation, fadeOutTextAnimation,
      fadeInBottomMenuAnimation, comeUpBottomMenuAnimation1, comeUpBottomMenuAnimation2, comeUpBottomMenuAnimation3,
      comeUpBottomMenuAnimation4, comeUpTextBottomMenuAnimation;

  double thresholdMarginTop1 = 40.0,
      thresholdMarginTop2 = 60.0,
      thresholdSizeBtn1 = 10.0,
      thresholdSizeBtn2 = 30.0,
      thresholdBtnBottomMenu1 = 50.0,
      thresholdBtnBottomMenu2 = 75.0,
      thresholdTextBottomMenu1 = 50.0,
      thresholdTextBottomMenu2 = 75.0
  ;

  bool isBtnPressed = false;

  @override
  void initState() {
    super.initState();

    // Animation phrase 1 (drop down view with bounce)
    animControlPhrase1 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1800));
    dropDownAnimation =
        new Tween (begin: 0.0, end: 70.0).animate(
            new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 1.0, curve: Curves.easeOut)));
    dropDownAnimation.addListener(() {
      setState(() {});
    });
    fadeInViewAnimation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.8, curve: Curves.easeOut)));
    fadeInViewAnimation.addListener(() {
      setState(() {});
    });

    animControlPhrase1.forward();

    // Animation phrase 2 (zoom button when be pressed and show up bottom menu)
    animControlPhrase2 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));

    zoomBtnAnimation =
        new Tween(begin: 0.0, end: 40.0).animate(
            new CurvedAnimation(parent: animControlPhrase2, curve: Curves.easeOut));
    zoomBtnAnimation.addListener(() {
      setState(() {});
    });

    fadeOutViewAnimation = new Tween(begin: 1.0, end: 0.2).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.2, 0.8))
    );
    fadeOutViewAnimation.addListener(() {
      setState(() {});
    });

    fadeOutTextAnimation = new Tween(begin: 1.0, end: 0.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.2, 0.8))
    );
    fadeOutTextAnimation.addListener(() {
      setState(() {});
    });

    fadeInBottomMenuAnimation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.3, 0.5))
    );

    comeUpBottomMenuAnimation1 = new Tween(begin: 0.0, end: 100.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.3, 0.7, curve: Curves.decelerate))
    );
    comeUpBottomMenuAnimation2 = new Tween(begin: 0.0, end: 100.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.35, 0.75, curve: Curves.decelerate))
    );
    comeUpBottomMenuAnimation3 = new Tween(begin: 0.0, end: 100.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.4, 0.8, curve: Curves.decelerate))
    );
    comeUpBottomMenuAnimation4 = new Tween(begin: 0.0, end: 100.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.45, 0.85, curve: Curves.decelerate))
    );
    comeUpTextBottomMenuAnimation = new Tween(begin: 0.0, end: 20.0).animate(
        new CurvedAnimation(parent: animControlPhrase2, curve: new Interval(0.45, 0.85, curve: Curves.decelerate))
    );
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
  double processSizeBtn(double value) {
    if (value < 10.0) {
      return value;
    } else if (value < thresholdSizeBtn2) {
      return value = thresholdSizeBtn2 - thresholdSizeBtn1 - value;
    } else {
      return value = value - (thresholdSizeBtn2 + thresholdSizeBtn1);
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
    super.dispose();
  }

  void onBtnPressed() {
    animControlPhrase2.forward();
    isBtnPressed = true;
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
    double value1 = 0.0,
        value2 = 0.0,
        value3 = 0.0,
        value4 = 0.0
    ;
    if (isBtnPressed) {
      value1 = processMarginBottomMenu(comeUpBottomMenuAnimation1.value);
      value2 = processMarginBottomMenu(comeUpBottomMenuAnimation2.value);
      value3 = processMarginBottomMenu(comeUpBottomMenuAnimation3.value);
      value4 = processMarginBottomMenu(comeUpBottomMenuAnimation4.value);
    }

    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new RawMaterialButton(
              onPressed: () {},
              child: new Image.asset(
                'images/ic_book.png', width: 40.0, height: 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value1),
          ),
          new Container(
            child: new RawMaterialButton(
              onPressed: () {},
              child: new Image.asset(
                'images/ic_add.png', width: 40.0, height: 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value2),
          ),
          new Container(
            child: new RawMaterialButton(
              onPressed: () {},
              child: new Image.asset(
                'images/ic_clock.png', width: 40.0, height: 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value3),
          ),
          new Container(
            child: new RawMaterialButton(
              onPressed: () {},
              child: new Image.asset(
                'images/ic_cancel.png', width: 40.0, height: 40.0,
              ),
              constraints: new BoxConstraints(),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            margin: new EdgeInsets.only(bottom: value4),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      ),
      height: 120.0,
      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }

  Widget renderTextBottomMenu() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(
              'Book',
              style: new TextStyle(
                  color: new Color(0xFF575869),
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Order',
              style: new TextStyle(
                  color: new Color(0xFF575869),
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Reservation',
              style: new TextStyle(
                  color: new Color(0xFF575869),
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          new Expanded(
            child: new Text(
              'Cancel',
              style: new TextStyle(
                  color: new Color(0xFF575869),
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      margin: new EdgeInsets.only(left: 25.0, right: 25.0, bottom: comeUpTextBottomMenuAnimation.value),
      decoration: new BoxDecoration(color: Colors.red),
      height: 30.0,
    );
  }

  Widget renderBigTable(String colorTable, Function onPressed) {
    return new FlatButton(
      onPressed: onPressed,
      child:
      new Container(
        width: 120.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Image.asset('images/chair_top.png', width: 40.0, height: 20.0,),
                  new Container(width: 10.0,),
                  new Image.asset('images/chair_top.png', width: 40.0, height: 20.0,),
                ],
              ),
              width: 90.0,
            ),
            new Stack(
              children: <Widget>[
                new Image.asset(
                  colorTable == 'green' ? 'images/table_big_green.png' : 'images/table_big_pink.png',
                  width: 120.0,
                  height: 60.0,
                  fit: BoxFit.contain,),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          '01',
                          style: new TextStyle(color: new Color(0xFF575869), fontSize: 14.0)
                      ),
                      new Container(height: 15.0,),
                      new Text(
                          'Available',
                          style: new TextStyle(color: new Color(0xFF575869), fontSize: 10.0)
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
                  new Image.asset('images/chair_bottom.png', width: 40.0, height: 20.0,),
                  new Container(width: 10.0,),
                  new Image.asset('images/chair_bottom.png', width: 40.0, height: 20.0,),
                ],
              ),
              width: 90.0,
            ),
          ],
        ),
      ),
      padding: new EdgeInsets.all(0.0),
    );
  }

  // With press animation for demo
  Widget renderBigTable2(String colorTable, Function onPressed) {
    double value = 0.0;
    if (isBtnPressed) {
      value = processSizeBtn(zoomBtnAnimation.value);
    }

    return new FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child:
      new Container(
        width: 120.0 - value,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Image.asset(
                      'images/chair_top.png',
                      width: 40.0 - value / 2.0,
                      height: 20.0 - value / 4.0
                  ),
                  new Expanded(child: new Container()),
                  new Image.asset(
                      'images/chair_top.png',
                      width: 40.0 - value / 2.0,
                      height: 20.0 - value / 4.0
                  ),
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
                  color: isBtnPressed ? new Color(0xff7DD5AF) : null,
                ),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          '01',
                          style: new TextStyle(
                              color: isBtnPressed ? Colors.white : new Color(0xFF575869),
                              fontSize: 14.0 - value / 4.0
                          )
                      ),
                      new Container(height: 15.0 - value / 4.0),
                      new Text(
                          'Available',
                          style: new TextStyle(
                              color: isBtnPressed ? Colors.white : new Color(0xFF575869),
                              fontSize: 10.0 - value / 4.0
                          )
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
                  new Image.asset(
                      'images/chair_bottom.png',
                      width: 40.0 - value / 2.0,
                      height: 20.0 - value / 4.0
                  ),
                  new Expanded(child: new Container()),
                  new Image.asset('images/chair_bottom.png',
                      width: 40.0 - value / 2.0,
                      height: 20.0 - value / 4.0
                  ),
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

  Widget renderSmallTable(String colorTable, Function onPressed) {
    return new FlatButton(
      onPressed: onPressed,
      child:
      new Container(
        width: 60.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Image.asset('images/chair_top.png', width: 40.0, height: 20.0,),
                ],
              ),
              width: 40.0,
            ),
            new Stack(
              children: <Widget>[
                new Image.asset(
                  colorTable == 'green' ? 'images/table_small_green.png' : 'images/table_small_yellow.png',
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.contain,
                ),
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          '01',
                          style: new TextStyle(color: new Color(0xFF575869), fontSize: 14.0)
                      ),
                      new Container(height: 15.0,),
                      new Text(
                          'Taken',
                          style: new TextStyle(color: new Color(0xFF575869), fontSize: 10.0)
                      )
                    ],
                  ),
                  margin: new EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
                )
              ],
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Image.asset('images/chair_bottom.png', width: 40.0, height: 20.0,),
                ],
              ),
              width: 40.0,
            ),
          ],
        ),
      ),
      padding: new EdgeInsets.all(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            top: 40.0 + processMarginBodyContent(dropDownAnimation.value),
            left: 0.0,
            right: 0.0,
            child: new Opacity(
              opacity: fadeInViewAnimation.value,
              child: new Column(
                children: <Widget>[

                  // Text entrance
                  new Center(
                    child: new Opacity(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                        child: new Text(
                          'ENTRANCE',
                          style: new TextStyle(color: new Color(0xFF575869), fontWeight: FontWeight.bold,),
                        ),
                      ),
                      opacity: fadeOutTextAnimation.value,
                    ),
                  ),

                  // Group tables
                  new Column(
                    children: <Widget>[

                      // Big table
                      new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Container(
                                child: renderBigTable2('green', onBtnPressed), width: 120.0
                            ),
                            new Opacity(
                                child: renderBigTable('pink', null),
                                opacity: fadeOutViewAnimation.value
                            ),
                          ],
                        ),
                        margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 120.0,
                      ),

                      // Small table
                      new Container(
                        child: new Opacity(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              renderSmallTable('green', null),
                              renderSmallTable('yellow', null),
                              renderSmallTable('green', null),
                            ],
                          ),
                          opacity: fadeOutViewAnimation.value,
                        ),
                        margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                        height: 100.0,
                      ),

                      // Big table
                      new Container(
                        child: new Opacity(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              renderBigTable('pink', null),
                              renderBigTable('green', null),
                            ],
                          ),
                          opacity: fadeOutViewAnimation.value,
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
            child: new Opacity(
                opacity: fadeInBottomMenuAnimation.value,
                child: renderBtnBottomMenu()
            ),
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
          ),

          // Text bottom menu
          new Positioned(
            child: new Opacity(
                opacity: fadeInBottomMenuAnimation.value,
                child: renderTextBottomMenu()
            ),
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
          ),
        ],
      ),
    );
  }
}

