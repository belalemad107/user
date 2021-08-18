import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final String content;
  MyCard({this.content = " - "});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(child: Container(child: Text(widget.content)));
  }
}
