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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> onWillPopScope() {
    Navigator.pop(context);
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new RestaurantAnimation()));
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: new Container(), onWillPop: onWillPopScope);
  }
}
