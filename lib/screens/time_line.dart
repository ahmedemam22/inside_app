import 'package:flutter/material.dart';
import 'package:insideapp/widgets/time_line_widget.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeLineWidget(),
    );
  }
}
