import 'dart:math';

import 'package:demo_flutter/bottom_controls.dart';
import 'package:demo_flutter/songs.dart';
import 'package:demo_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:fluttery/gestures.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MUSIC PLAYER',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  State createState() => new MusicPlayerScreenState();
}

class MusicPlayerScreenState extends State<MusicPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          color: const Color(0xFFDDDDDD),
          onPressed: () {},
        ),
        title: new Text(''),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), onPressed: null)
        ],
      ),
      body: new Column(
        children: <Widget>[
          // Seek bar
          new Expanded(
              child: new RadialDragGestureDetector(
                child: new Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: new Center(
                    child: new Container(
                      width: 140.0,
                      height: 140.0,
                      child: new RadialProgressBar(
                        progressPercent: 0.25,
                        thumbPosition: 0.25,
                        progressColor: accentColor,
                        thumbColor: lightAccentColor,
                        trackColor: const Color(0xFFDDDDDD),
                        innerPadding: const EdgeInsets.all(10.0),
                        outerPadding: const EdgeInsets.all(10.0),
                        child: new ClipOval(
                          clipper: new CircleClipper(),
                          child: new Image.network(
                            demoPlaylist.songs[0].albumArtUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ),

          // Visualizer
          new Container(
            width: double.infinity,
            height: 125.0,
          ),

          // Song title, artist name and controls
          new BottomControls()
        ],
      ),
    );
  }
}

class RadialProgressBar extends StatefulWidget {

  final double trackWidth;
  final Color trackColor;
  final double progressWidth;
  final Color progressColor;
  final double progressPercent;
  final double thumbSize;
  final Color thumbColor;
  final double thumbPosition;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final Widget child;

  RadialProgressBar({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
    this.progressWidth = 5.0,
    this.progressColor = Colors.black,
    this.progressPercent = 0.0,
    this.thumbSize = 10.0,
    this.thumbColor = Colors.black,
    this.thumbPosition = 0.0,
    this.outerPadding = const EdgeInsets.all(0.0),
    this.innerPadding = const EdgeInsets.all(0.0),
    this.child
  });

  @override
  _RadialSeekBarState createState() => new _RadialSeekBarState();
}

class _RadialSeekBarState extends State<RadialProgressBar> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: widget.outerPadding,
      child: new CustomPaint(
          foregroundPainter: new RadialSeekBarPainter(
              trackWidth: widget.trackWidth,
              trackColor: widget.trackColor,
              progressWidth: widget.progressWidth,
              progressColor: widget.progressColor,
              progressPercent: widget.progressPercent,
              thumbSize: widget.thumbSize,
              thumbColor: widget.thumbColor,
              thumbPosition: widget.thumbPosition
          ),
          child: new Padding(
            padding: _insetsForPainter() + widget.innerPadding,
            child: widget.child,
          )
      ),
    );
  }

  EdgeInsets _insetsForPainter() {
    // Make room for the painted track, progress and thumb. We divide by 2.0
    // because we want to allow flush painting against the track, so we only
    // need to account the thickness outside the track, not inside
    final outerThickness = max(
        widget.trackWidth,
        max(
            widget.progressWidth,
            widget.thumbSize
        )
    ) / 2.0;
    return new EdgeInsets.all(outerThickness);
  }
}

class RadialSeekBarPainter extends CustomPainter {

  final double trackWidth;
  final Paint trackPaint;
  final double progressWidth;
  final Paint progressPaint;
  final double progressPercent;
  final double thumbSize;
  final Paint thumbPaint;
  final double thumbPosition;

  RadialSeekBarPainter({
    @required this.trackWidth,
    @required trackColor,
    @required this.progressWidth,
    @required progressColor,
    @required this.progressPercent,
    @required this.thumbSize,
    @required thumbColor,
    @required this.thumbPosition,
  })
      :
        trackPaint = new Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth,
        progressPaint = new Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = progressWidth
          ..strokeCap = StrokeCap.round,
        thumbPaint = new Paint()
          ..color = thumbColor
          ..style = PaintingStyle.fill
  ;

  @override
  void paint(Canvas canvas, Size size) {
    final outerThickness = max(trackWidth, max(progressWidth, thumbSize));
    Size constrainedSize = new Size(size.width - outerThickness, size.height - outerThickness);

    final center = new Offset(size.width / 2, size.height / 2);
    final radius = min(constrainedSize.width, constrainedSize.height) / 2;

    // Paint track
    canvas.drawCircle(
        center,
        radius,
        trackPaint
    );

    // Paint progress
    final progressAngle = 2 * pi * progressPercent;
    canvas.drawArc(
        new Rect.fromCircle(
            center: center,
            radius: radius
        ),
        -pi / 2,
        progressAngle,
        false,
        progressPaint
    );

    // Paint thumb
    final thumbAngle = 2 * pi * thumbPosition - (pi / 2);
    final thumbX = cos(thumbAngle) * radius;
    final thumbY = sin(thumbAngle) * radius;
    final thumbCenter = new Offset(thumbX, thumbY) + center;
    final thumbRadius = thumbSize / 2.0;
    canvas.drawCircle(
        thumbCenter,
        thumbRadius,
        thumbPaint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}