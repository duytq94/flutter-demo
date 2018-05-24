import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FETCH"),
        centerTitle: true,
      ),
      body: new FetchApiScreen(),
    );
  }
}

class FetchApiScreen extends StatefulWidget {
  @override
  State createState() => new FetchApiScreenState();
}

class FetchApiScreenState extends State<FetchApiScreen> {
  List data;

  Future<void> fetchPost() async {
    final response = await http.get('https://api.stackexchange.com/2.2/questions?sort=activity&site=stackoverflow');
    this.setState(() {
      data = json.decode(response.body)['items'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (BuildContext context, int index) {
      return new Card(
        margin: new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: new Row(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(data[index]['owner']['profile_image']),
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(50.0))),
            ),
            new Column(
              children: <Widget>[new Text(data[index]['title'])],
            )
          ],
        ),
      );
    });
  }
}
