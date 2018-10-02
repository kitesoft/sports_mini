import 'package:sports_mini/common/base.dart';
import '../feed-list.dart';
import '../match-list.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key key, @required this.league, @required this.teamId})
      : super(key: key);

  final League league;
  final int teamId;
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage>
    with SingleTickerProviderStateMixin {
  Dio dio = new Dio();
  Map teamData;
  TabController _tabController;
  _getTeamData() async {
    String reqUrl =
        'http://v2.sohu.com/sports-data/football/${widget.league.id}/teams/${widget.teamId}';
    Response res = await dio.get(reqUrl, data: null);
    var data = res.data != null ? res.data : {};
    setState(() {
      teamData = data;
    });
  }

  @override
  void initState() {
    _getTeamData();
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  Widget _buildHeader() {
    return Container(
      height: 150.0,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage('images/stadium_bg.png'),
              fit: BoxFit.cover)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 60.0,
          height: 60.0,
          margin: EdgeInsets.only(right: 20.0),
          child: Image.network(teamData['teamInfo']['flag']),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  teamData['teamInfo']['teamName'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                  child: Text(
                '战绩：${teamData["wins"]}胜 ${teamData["ties"]}平 ${teamData["losses"]}负',
                style: TextStyle(color: Colors.white),
              )),
              Container(
                  child: Text(
                '排名：英超第${teamData["place"]}名',
                style: TextStyle(color: Colors.white),
              ))
            ])
      ]),
    );
  }

  Widget _buildPageBody(BuildContext context) {
    return Column(children: [
      Container(
        height: 150.0,
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('images/stadium_bg.png'),
                fit: BoxFit.cover)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 60.0,
            height: 60.0,
            margin: EdgeInsets.only(right: 20.0),
            child: Image.network(teamData['teamInfo']['flag']),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    teamData['teamInfo']['teamName'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                    child: Text(
                  '战绩：${teamData["wins"]}胜 ${teamData["ties"]}平 ${teamData["losses"]}负',
                  style: TextStyle(color: Colors.white),
                )),
                Container(
                    child: Text(
                  '排名：英超第${teamData["place"]}名',
                  style: TextStyle(color: Colors.white),
                ))
              ])
        ]),
      ),
      Container(height: 300.0, child: Center(child: Text('球队页 TAB - TBD')))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    String teamName = teamData != null ? teamData['teamInfo']['teamName'] : '';
    final streamId = widget.league.feed["team"];
    final String feedApi =
        'https://v2.sohu.com/integration-api/mix/region/$streamId';
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _buildHeader()),
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
              FeedList(api: feedApi, params: {'mpId': teamName}),
              MatchList(league: widget.league)
            ],
            controller: _tabController,
          ))
        ],
      ),
    );
  }
}
