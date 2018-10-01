import 'package:sports_mini/common/base.dart';
//
import '../feed-list.dart';
class HomeNews extends StatefulWidget {
  HomeNews({Key key, this.league}) : super(key: key);
  final League league;
  final Map feedParams = {};
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  @override
    void initState() {
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    int streamId = widget.league.feed['home'];
    final String feedApi =
        'https://v2.sohu.com/integration-api/mix/region/$streamId';
    Widget feedArea;
    if (streamId == null) {
      feedArea = Container(child: Text('暂时没有更多内容了……'));
    } else {
      feedArea = FeedList(api: feedApi, params: widget.feedParams);
    }
    return feedArea;
  }
}
