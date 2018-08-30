import 'package:flutter/material.dart';
import '../feed-list.dart';
import './live-schedule.dart';

class HomeNews extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  final String feedApi = 'https://v2.sohu.com/integration-api/mix/region/15';
  final Map feedParams = {};

  @override
  Widget build(BuildContext context) {
    return FeedList(api: feedApi, params: feedParams);
    // return Expanded(
    //     child: Column(
    //   children: [
    //     // 热门赛事
    //     LiveSchedule(),
    //     FeedList(api: feedApi, params: feedParams)
    //   ],
    // ));
  }
}
