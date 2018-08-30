import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './feed-item.dart';
import 'package:collection/collection.dart';
import './_helper/feed.dart';

class FeedList extends StatefulWidget {
  FeedList({@required this.api, @required this.params});
  final String api;
  final Map params;
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
  List feedList = [];
  Dio dio = new Dio();

  @override
  void initState() {
    _getFeedList();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _getFeedList();
    super.didUpdateWidget(oldWidget);
  }

  _getFeedList() async {
    var reqParam = new CombinedMapView([
      widget.params,
      {
        'page': pageNo,
        'size': pageSize,
        'mpId': mpId,
        'client': client,
        'requestId': requestId,
        'pvId': pvId
      }
    ]);
    Response res = await dio.get(widget.api, data: reqParam);
    var dataList = res.data != null ? res.data['data'] : [];
    setState(() {
      feedList = FeedUtil.formatFeedList(dataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      itemCount: feedList.length,
      itemBuilder: (context, index) {
        return FeedItem(feed: feedList[index]);
      },
    );
  }
}
