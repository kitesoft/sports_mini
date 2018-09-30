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
    Widget feedArea;
    if (streamId == null) {
      feedArea = Container(child: Text('暂时没有更多内容了……'));
    } else {
      feedArea = FeedList(api: feedApi, params: feedParams);
    }

    // return CustomScrollView(slivers: [LiveSchedule(league: league), feedArea]);
    // return FeedList(api: feedApi, params: feedParams);
    return JScroll(
      pull: () {},
      child: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: LiveSchedule(league: this.league),
        ),
        SliverToBoxAdapter(child: feedArea)
      ]),
    );
  }
}
