import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './feed-item.dart';

class FeedList extends StatefulWidget {
  FeedList({Key key}) : super(key: key);

  @override
  _FeedList createState() => new _FeedList();
}

class _FeedList extends State<FeedList> {
  var pageNo = 1;
  var pageSize = 20;
  var mpId = '';
  var client = 1;
  var requestId = '1533292365296o3ogyy_1533987330763';
  var pvId = '15339873307630sc2cpc';
  var feedList = [];
  Dio dio = new Dio();

  // @override
  // void initState() {
  //   this.feedList = _getFeedList();
  //   super.initState();
  // }

  @override
  void didUpdateWidget(oldWidget) {
    _getFeedList();
    super.didUpdateWidget(oldWidget);
  }

  _getFeedList() async {
    final url = 'https://v2.sohu.com/integration-api/mix/region/15';
    Response res = await dio.get(url, data: {
      'page': pageNo,
      'size': pageSize,
      'mpId': mpId,
      'client': client,
      'requestId': requestId,
      'pvId': pvId
    });
    debugPrint(res.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          FeedItem({'showType': 1}),

          // FeedItem(feed: {
          //   'type': 2
          // }),
          // FeedItem(feed: {
          //   'type': 3
          // }),
          // FeedItem(feed: {
          //   'type': 4
          // }),
          // FeedItem(feed: {
          //   'type': 5
          // }),
        ],
      ),
    );
  }
}
