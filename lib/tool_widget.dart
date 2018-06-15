import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ToolWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "TOOL WIDGET",
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new ToolWidgetScreen(),
    );
  }
}

class ToolWidgetScreen extends StatefulWidget {
  @override
  State createState() => new ToolWidgetScreenState();
}

enum Answer { STANDBY, POWER_OFF, RESTART }

class ToolWidgetScreenState extends State<ToolWidgetScreen> {
  int selected = 0;
  bool isCheck = true;
  bool isSwitch = true;
  DateTime currentDate = new DateTime.now();

  Future<Null> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            contentPadding: new EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 10.0),
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
                  Navigator.pop(context, Answer.STANDBY);
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.pause,
                        color: Colors.yellow[700],
                      ),
                      margin: new EdgeInsets.only(right: 20.0),
                    ),
                    new Text(
                      'Standby',
                      style: new TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.POWER_OFF);
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                      ),
                      margin: new EdgeInsets.only(right: 20.0),
                    ),
                    new Text(
                      'Power off',
                      style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              new SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.RESTART);
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        Icons.refresh,
                        color: Colors.green,
                      ),
                      margin: new EdgeInsets.only(right: 20.0),
                    ),
                    new Text(
                      'Restart',
                      style: new TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case Answer.STANDBY:
        break;
      case Answer.POWER_OFF:
        break;
      case Answer.RESTART:
        break;
    }
  }

  Future<Null> openDatePicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2017),
      lastDate: DateTime(2020),
    );
    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;
      });
    }
  }

  List<Widget> groupRadio() {
    List<Widget> listRadio = new List();
    for (int i = 0; i < 3; i++) {
      listRadio.add(new Row(
        children: <Widget>[
          new Text(
            'Option $i',
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Radio(
            value: i,
            groupValue: selected,
            onChanged: (value) {
              onRadioChange(value);
            },
            activeColor: Colors.purple,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ));
    }
    return listRadio;
  }

  void onRadioChange(int value) {
    setState(() {
      selected = value;
    });
  }

  void onCheck(bool value) {
    setState(() {
      isCheck = value;
    });
  }

  void onSwitch(bool value) {
    setState(() {
      isSwitch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Column(
      children: <Widget>[
        new Container(
          child: new FlatButton(
            onPressed: openDialog,
            child: new Text(
              'OPEN DIALOG',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.purple,
            highlightColor: Colors.purple[200],
          ),
          margin: new EdgeInsets.all(20.0),
        ),
        new Container(
          child: new Column(
            children: <Widget>[
              new FlatButton(
                onPressed: () {
                  openDatePicker(context);
                },
                child: new Text(
                  'DATE PICKER',
                  style: new TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
                highlightColor: Colors.purple[200],
              ),
              new Text(
                'To day is ${currentDate.day}th',
              ),
            ],
          ),
          margin: new EdgeInsets.all(20.0),
        ),
        new Column(
          children: groupRadio(),
        ),
        new Checkbox(
          value: isCheck,
          onChanged: (value) {
            onCheck(value);
          },
          activeColor: Colors.purple,
        ),
        new Switch(
          value: isSwitch,
          onChanged: (value) {
            onSwitch(value);
          },
          activeColor: Colors.purple,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
