import 'dart:async';

import 'package:demo_flutter/restaurant_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class RestaurantAnimation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RESTAURANT2"),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new RestaurantAnimation()));
            }),
      ),
      body: new RestaurantAnimationScreen2(),
    );
  }
}

class RestaurantAnimationScreen2 extends StatefulWidget {
  @override
  State createState() => new RestaurantAnimationScreenState2();
}

class RestaurantAnimationScreenState2 extends State<RestaurantAnimationScreen2> with TickerProviderStateMixin {
  AnimationController animControlPhrase1;
  Animation comeUpPlateAnim1, comeUpPlateAnim2, comeUpPlateAnim3, fadeInPlateAnim1, fadeInPlateAnim2, fadeInPlateAnim3;

  @override
  void initState() {
    super.initState();

    // Animation phrase 1
    animControlPhrase1 = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2500));

    comeUpPlateAnim1 = new Tween(begin: 0.0, end: 20.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.1, 0.4)));
    comeUpPlateAnim1.addListener(() {
      setState(() {});
    });
    comeUpPlateAnim2 = new Tween(begin: 0.0, end: 40.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.5)));
    comeUpPlateAnim2.addListener(() {
      setState(() {});
    });
    comeUpPlateAnim3 = new Tween(begin: 0.0, end: 20.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.6)));
    comeUpPlateAnim3.addListener(() {
      setState(() {});
    });

    fadeInPlateAnim1 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.1, 0.4)));
    fadeInPlateAnim1.addListener(() {
      setState(() {});
    });

    fadeInPlateAnim2 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.2, 0.5)));
    fadeInPlateAnim2.addListener(() {
      setState(() {});
    });

    fadeInPlateAnim3 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlPhrase1, curve: new Interval(0.3, 0.6)));
    fadeInPlateAnim3.addListener(() {
      setState(() {});
    });

    animControlPhrase1.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animControlPhrase1.dispose();
  }

  Future<bool> onWillPopScope() {
    Navigator.pop(context);
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new RestaurantAnimation()));
    return new Future.value(false);
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
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
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
            margin: new EdgeInsets.only(bottom: 0.0),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
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
            margin: new EdgeInsets.only(bottom: 0.0),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
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
            margin: new EdgeInsets.only(bottom: 0.0),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
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
            margin: new EdgeInsets.only(bottom: 0.0),
            width: 40.0,
            height: 40.0,
          ),
          new Container(
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
            margin: new EdgeInsets.only(bottom: 0.0),
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
      margin: new EdgeInsets.only(left: 25.0, right: 25.0, bottom: 0.0),
      height: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Container(
          width: double.infinity,
          height: double.infinity,
//          decoration: new BoxDecoration(color: new Color(0xfff8f9fb)),
          child: new Stack(
            children: <Widget>[
              // Tab menu
              renderTabMenu(),

              // Body content
              new Positioned(
                  top: 70.0,
                  left: 0.0,
                  right: 0.0,
                  child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                          // Line 1
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Plate 1
                              new Opacity(
                                child: new Container(
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        child: new FlatButton(
                                          onPressed: () {},
                                          padding: new EdgeInsets.all(0.0),
                                          child: new Image.asset(
                                            'images/flan.png',
                                            width: 130.0,
                                            height: 130.0,
                                          ),
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
                                  margin: new EdgeInsets.only(bottom: 20.0 + comeUpPlateAnim1.value),
                                  height: 160.0,
//                                  decoration: new BoxDecoration(color: Colors.cyan),
                                ),
                                opacity: fadeInPlateAnim1.value,
                              ),

                              // Plate 2
                              new Opacity(
                                child: new Container(
                                  child: new Column(
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
                                  height: 160.0,
//                                  decoration: new BoxDecoration(color: Colors.cyan),
                                ),
                                opacity: fadeInPlateAnim2.value,
                              )
                            ],
                          ),
//                          decoration: new BoxDecoration(color: Colors.blue),
                          height: 200.0,
                        ),

                        // Line 2
                        new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Plate 3
                              new Opacity(
                                child: new Container(
                                  child: new FlatButton(
                                    onPressed: () {},
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Image.asset(
                                      'images/chicken.png',
                                      width: 130.0,
                                      height: 130.0,
                                    ),
                                  ),
                                  margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim3.value),
                                ),
                                opacity: fadeInPlateAnim3.value,
                              ),

                              // Plate 4
                              new Opacity(
                                child: new Container(
                                  child: new FlatButton(
                                    onPressed: () {},
                                    padding: new EdgeInsets.all(0.0),
                                    child: new Image.asset(
                                      'images/salad.png',
                                      width: 130.0,
                                      height: 130.0,
                                    ),
                                  ),
                                  margin: new EdgeInsets.only(bottom: 0.0 + comeUpPlateAnim3.value),
                                ),
                                opacity: fadeInPlateAnim3.value,
                              )
                            ],
                          ),
//                          decoration: new BoxDecoration(color: Colors.amber),
                          height: 150.0,
                        ),
                      ],
                    ),
//                    decoration: new BoxDecoration(color: Colors.red),
                  )),

              // Button bottom menu
              new Positioned(
                child: new Opacity(opacity: 1.0, child: renderBtnBottomMenu()),
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
              ),

              // Text bottom menu
              new Positioned(
                child: new Opacity(opacity: 1.0, child: renderTextBottomMenu()),
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
