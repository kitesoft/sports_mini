import 'package:sports_mini/common/base.dart';
//
import '../team/page.dart';
import '../feed-list.dart';
import '../match-list.dart';
//
import '../_helper/match.dart';

class MatchPage extends StatefulWidget {
  MatchPage({Key key, @required this.league, @required this.gameCode})
      : super(key: key);

  final League league;
  final int gameCode;
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage>
    with SingleTickerProviderStateMixin {
  Dio dio = new Dio();
  Map matchData;
  TabController _tabController;
  _getMatchData() async {
    String reqUrl =
        'http://v2.sohu.com/sports-data/football/${widget.league.id}/games/${widget.gameCode}';
    Response res = await dio.get(reqUrl, data: null);
    var data = res.data != null ? res.data : null;
    if (!mounted) return;
    var formatData = MatchUtil.formatMatchInfo(data, widget.league);
    setState(() {
      matchData = formatData;
    });
  }

  @override
  void initState() {
    _getMatchData();
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  _buildStatusGradient(int status) {
    LinearGradient gradient;
    // 已结束
    if (status == 3 || status == 4) {
      gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.0,
            1.0
          ],
          colors: [
            Color.fromRGBO(189, 189, 189, 0.5),
            Color.fromRGBO(72, 72, 72, 1.0),
          ]);
    } else if (status == 2) {
      gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.0,
            1.0
          ],
          colors: [
            Color.fromRGBO(189, 189, 189, 0.5),
            Color.fromRGBO(72, 72, 72, 1.0),
          ]);
    } else {
      gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.0,
            1.0
          ],
          colors: [
            Color.fromRGBO(189, 189, 189, 0.5),
            Color.fromRGBO(72, 72, 72, 1.0),
          ]);
    }
    return gradient;
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        height: 150.0,
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('images/stadium_bg.png'),
                fit: BoxFit.cover)),
        child: Row(
          children: [
            // 主队信息
            Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                      return new TeamPage(
                          league: widget.league, teamId: matchData['hTeamId']);
                    }));
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: Image.network(matchData['hflag']),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Text(matchData['hname'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white)))
                      ]),
                )),
            // 对战信息
            Expanded(
              flex: 4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      matchData['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(matchData['progressShow'],
                          style:
                              TextStyle(fontSize: 19.0, color: Colors.white)),
                    ),
                    Container(
                        width: 60.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.blue,
                            gradient: _buildStatusGradient(3)),
                        child: Center(
                            child: Text(
                          matchData['statusShow'],
                          style: TextStyle(fontSize: 10.0, color: Colors.white),
                        )))
                  ]),
            ),
            // 客队信息
            Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                      return new TeamPage(
                          league: widget.league, teamId: matchData['vTeamId']);
                    }));
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          child: Image.network(matchData['vflag']),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Text(matchData['vname'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white)))
                      ]),
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final streamId = widget.league.feed["match"];
    final String feedApi =
        'https://v2.sohu.com/integration-api/mix/region/$streamId';
    Widget pageBody;
    String showTitle = '';
    if (matchData == null) {
      pageBody = Center(child: BaseLoading());
    } else {
      showTitle = matchData['showTitle'];
      pageBody = CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _buildHeader(context)),
          SliverToBoxAdapter(
              child: TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.orange,
                  indicatorColor: Colors.orange,
                  tabs: [
                    Tab(
                      child: Container(child: Text('要闻')),
                    ),
                    Tab(
                      child: Container(child: Text('赛程')),
                    ),
                  ],
                  controller: _tabController)),
          SliverFillRemaining(
              child: TabBarView(
            children: <Widget>[
              FeedList(api: feedApi, params: {'mpId': matchData['target']}),
              MatchList(league: widget.league)
            ],
            controller: _tabController,
          ))
        ],
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(showTitle),
        ),
        body: pageBody);
  }
}
