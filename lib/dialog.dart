import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

class DuyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "DIALOG",
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new DuyDialogScreen(),
    );
  }
}

class DuyDialogScreen extends StatefulWidget {
  @override
  State createState() => new DuyDialogScreenState();
}

enum Answer { YES, NO, MAYBE }

class DuyDialogScreenState extends State<DuyDialogScreen> {
  String userAnswer = '';

  void setAnswer(String value) {
    setState(() {
      userAnswer = value;
    });
  }

  Future<Null> _askedToLead() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            children: <Widget>[
              new Container(
                color: Colors.deepOrange,
                height: 150.0,
                margin: new EdgeInsets.all(0.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.power_settings_new,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: new EdgeInsets.only(top: 20.0, bottom: 10.0),
                    ),
                    new Text(
                      'Power Off',
                      style: new TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      'The system will power off\nautomatically in 51 seconds',
                      style: new TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.YES);
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.file_download,
                        color: Colors.grey,
                      ),
                      margin: new EdgeInsets.only(right: 20.0),
                    ),
                    new Text(
                      'Suspend to disk',
                      style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.YES);
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.power_settings_new,
                        color: Colors.grey,
                      ),
                      margin: new EdgeInsets.only(right: 20.0),
                    ),
                    new Text(
                      'Power off',
                      style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.YES);
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.refresh,
                        color: Colors.grey,
                      ),
                      margin: new EdgeInsets.only(right: 20.0),
                    ),
                    new Text(
                      'Restart',
                      style: new TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case Answer.YES:
        setAnswer('yes');
        break;
      case Answer.NO:
        setAnswer('no');
        break;
      case Answer.MAYBE:
        setAnswer('maybe');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Container(
      child: new FlatButton(onPressed: _askedToLead, child: new Text('OPEN')),
    );
  }
}
