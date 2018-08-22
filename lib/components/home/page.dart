import 'package:flutter/material.dart';
import '../side-bar.dart';
import './home-news.dart';
import './match-list.dart';
import './standing-teams.dart';
import './standing-shooters.dart';
import 'standing-assists.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  TabController tabCtrl;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5)
      ..addListener(() {
        setState(() {
          
        });
      });
  }

  @override
  void didUpdateWidget(oldWidget) {
    // _getFeedList();
    super.didUpdateWidget(oldWidget);
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
              Tab(
                  child: Text('积分')
              ),
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
          child: new SideBar(),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            HomeNews(),
            MatchList(),
            StandingTeams(),
            StandingShooters(),
            StandingAssists()
          ],
        ));
  }
}