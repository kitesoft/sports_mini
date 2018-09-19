import 'package:flutter/material.dart';
import '../feed-list.dart';
import './live-schedule.dart';
import 'package:sports_mini/model/league.dart';

class HomeNews extends StatelessWidget {
  HomeNews({Key key, this.league}) : super(key: key);
  final League league;
  final Map feedParams = {};

  @override
  Widget build(BuildContext context) {
    String streamId = league.feed['home'];
    final String feedApi =
        'https://v2.sohu.com/integration-api/mix/region/' + streamId;
    Widget feedArea;
    if (streamId == null) {
      feedArea = Container(child: Text('暂时没有更多内容了……'));
    } else {
      feedArea = FeedList(api: feedApi, params: feedParams);
    }

    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index == 0 ? LiveSchedule(league: league) : feedArea;
      },
      itemCount: 2,
    );
  }
}
