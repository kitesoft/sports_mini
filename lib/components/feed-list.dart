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
  // Component Lib 参数
  bool allLoaded = false;
  bool loading = false;

  // Feed 请求参数
  Map feedReqParam = {
    'pageNo': 1,
    'pageSize': 20,
    'mpId': '',
    'client': 1,
    'requestId': '1533292365296o3ogyy_1533987330763',
    'pvId': '15339873307630sc2cpc'
  };
  // 组件 data2render 参数
  List feedList = [];
  Dio dio = new Dio();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _initFeedList();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _initFeedList();
    super.didUpdateWidget(oldWidget);
  }

  _initFeedList() async {
    var reqParam = new CombinedMapView([widget.params, feedReqParam]);
    Response res = await dio.get(widget.api, data: reqParam);
    var dataList = res.data != null ? res.data['data'] : [];
    setState(() {
      feedList = FeedUtil.formatFeedList(dataList);
      loading = false;
      allLoaded = false;
    });
  }

  _getMoreData() async {
    bool loadedFlag = this.allLoaded;
    if (!loading && !allLoaded) {
      feedReqParam['pageNo']++;
      setState(() {
        loading = true;
      });
      //
      var reqParam = new CombinedMapView([widget.params, feedReqParam]);
      Response res = await dio.get(widget.api, data: reqParam);
      var dataList = res.data != null ? res.data['data'] : [];
      List joinList = new List.from(feedList)..addAll(dataList);
      if (dataList.length == 0) {
        loadedFlag = true;
      } else {
        loadedFlag = false;
      }
      setState(() {
        feedList = FeedUtil.formatFeedList(joinList);
        loading = false;
        allLoaded = loadedFlag;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
            child:
                allLoaded ? Text('暂时没有更多内容了……') : CircularProgressIndicator()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      itemCount: feedList == null ? 0 : feedList.length + 1,
      itemBuilder: (context, index) {
        if (index == feedList.length) {
          return _buildProgressIndicator();
        } else {
          return FeedItem(feed: feedList[index]);
        }
      },
      controller: _scrollController,
    );
  }
}
