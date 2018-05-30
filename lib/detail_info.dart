import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'DETAIL INFO',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: new Info());
  }
}

class Info extends StatefulWidget {
  @override
  createState() => new InfoState();
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new Scaffold(
      body: content(),
    );
  }

  Widget content() {
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'UIT campus',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Ho Chi Minh city, Viet Nam',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new FavoriteWidget()
        ],
      ),
    );

    Widget imageSection = new Image.asset(
      'images/bg_uit.jpg',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    );

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        'The University of Information Technology (UIT) is a member of Vietnam National University - Ho Chi Minh City (VNU-HCM) and is the only university of Vietnam that undertakes information and communication technology research and focused, in-depth training. The University has the youngest management, research and teaching staff of any VNU-HCM member, bringing great enthusiasm along with dynamic and creative advantages.',
        softWrap: true,
      ),
    );

    return new Scaffold(
        body: new Container(child: new ListView(children: [imageSection, titleSection, buttonSection, textSection])));
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  createState() => new FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorite ? new Icon(Icons.star) : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}
