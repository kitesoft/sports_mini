import 'package:flutter/material.dart';
import '../feed-list.dart';
class HomeNews extends StatelessWidget {
  HomeNews({Key key, this.streamId}) : super(key: key);
  final String streamId;
  final Map feedParams = {};

  @override
  Widget build(BuildContext context) {
    final String feedApi = 'https://v2.sohu.com/integration-api/mix/region/' + streamId;
    if (streamId == null) {
      return Container(
        child: Text('暂时没有更多内容了……')
      );
    } else {
      return FeedList(api: feedApi, params: feedParams);
    }
    
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
