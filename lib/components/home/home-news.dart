import 'package:sports_mini/common/base.dart';
//
import '../feed-list.dart';
import './live-schedule.dart';

class HomeNews extends StatelessWidget {
  HomeNews({Key key, this.league}) : super(key: key);
  final League league;
  final Map feedParams = {};

  @override
  Widget build(BuildContext context) {
    String streamId = league.feed['home'];
    final String feedApi =
        'https://v2.sohu.com/integration-api/mix/region/' + streamId;
    // Widget feedArea;
    // if (streamId == null) {
    //   feedArea = Container(child: Text('暂时没有更多内容了……'));
    // } else {
    //   feedArea = FeedList(api: feedApi, params: feedParams);
    // }

    // return CustomScrollView(slivers: [LiveSchedule(league: league), feedArea]);
    // return FeedList(api: feedApi, params: feedParams);
    return CustomScrollView(slivers: <Widget>[
      new SliverFixedExtentList(
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              //构建一个测试列表
              return new Container(
                alignment: Alignment.center,
                color: Colors.blueGrey,
                child: new Text(
                  'SliverFixedExtentList',
                  textAlign: TextAlign.center,
                ),
              );
            },
            childCount: 1,
          ),

          ///强制孩子在滚动方向上有指定的范围
          ///指定itemExtent比让孩子确定自己的范围更有效率
          itemExtent: 200.0)
    ]);
  }
}
