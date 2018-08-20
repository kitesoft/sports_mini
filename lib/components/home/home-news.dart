import 'package:flutter/material.dart';
import '../feed-list.dart';
import './live-schedule.dart';

class HomeNews extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 热门赛事
        Expanded(
          child: ListView(
            children: <Widget>[
              LiveSchedule(),
              FeedList(),
            ],
          ),
        )
      ],
    );
  }
}
