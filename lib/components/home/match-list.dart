import 'package:flutter/material.dart';
import './match-item.dart';

class MatchList extends StatefulWidget {
  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MatchItem(),
        // MatchItem(),
      ]
    );
  }
}
