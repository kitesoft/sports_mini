import 'package:sports_mini/common/base.dart';
//
import '../side-bar.dart';
import './home-news.dart';
import '../match-list.dart';
import './standing-teams.dart';
import './standing-shooters.dart';
import './standing-assists.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.league}) : super(key: key);
  final League league;
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5)
      ..addListener(() {
        setState(() {});
      });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text('要闻'),
            ),
            Tab(
              child: Text('赛程'),
            ),
            Tab(child: Text('积分')),
            Tab(
              child: Text('射手'),
            ),
            Tab(
              child: Text('助攻'),
            ),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      endDrawer: new Drawer(
        child: new SideBar(league: widget.league)
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          HomeNews(league: widget.league),
          MatchList(league: widget.league),
          StandingTeams(league: widget.league),
          StandingShooters(league: widget.league),
          StandingAssists(league: widget.league)
        ],
      ),
    );
  }
}
