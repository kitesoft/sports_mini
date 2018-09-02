import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../common/loading.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key key, @required this.leagueId, @required this.teamId})
      : super(key: key);

  final int leagueId;
  final int teamId;
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  Dio dio = new Dio();
  Map teamData;
  _getTeamData() async {
    String reqUrl =
        'http://v2.sohu.com/sports-data/football/${widget.leagueId}/teams/${widget.teamId}';
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
  }

  @override
  void didUpdateWidget(oldWidget) {
    _getTeamData();
    super.didUpdateWidget(oldWidget);
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
    var pageBody = BaseLoading();
    if (teamData != null) {
      pageBody = _buildPageBody(context);
    }
    return new Scaffold(body: pageBody);
  }
}
