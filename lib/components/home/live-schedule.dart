import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../_helper/match.dart';

class LiveSchedule extends StatefulWidget {
  LiveSchedule({Key key}) : super(key: key);

  @override
  _LiveSchedule createState() => new _LiveSchedule();
}

class _LiveSchedule extends State<LiveSchedule> {
  List matchList;
  Dio dio = new Dio();

  _getScheduleData() async {
    List codes = [], games = [];
    final hotGameUrl = 'https://v2.sohu.com/sports-api/v2/matches/list/hot';
    final gameListUrl = 'https://v2.sohu.com/sports-data/football/17/game-list';
    Response preRes = await dio.get(hotGameUrl,
        data: {'leagueId': '17', 'time': DateTime.now().millisecondsSinceEpoch});
    var result = preRes.data;
    if (result != null && result['code'] == 0) {
      codes = result['data'];
    }
    List codeIds = codes.map((game) {
      return game['gameCode'];
    }).toList();
    Response preGames =
        await dio.get(gameListUrl, data: {'gameCodeList': codeIds.join(',')});
    games = preGames.data;
    setState(() {
      matchList = games;
    });
  }

  @override
  void initState() {
    _getScheduleData();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _getScheduleData();
    super.didUpdateWidget(oldWidget);
  }

  Container _buildItem(item) {
    return new Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 主队
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 27.0,
                  height: 27.0,
                  child: Image.network(item['hTeamData']['flag']),
                ),
                Container(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Text(item['hTeamData']['teamName']))
              ],
            ),
          ),
          // 详情
          Container(
            child: Column(
              children: <Widget>[
                Text(item['title'], style: TextStyle(fontSize: 7.0)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
                  child: Text(item['progressShow'],
                      style: TextStyle(fontSize: 13.0)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500]),
                      borderRadius: BorderRadius.circular(6.0)),
                  child:
                      Text(item['statusShow'], style: TextStyle(fontSize: 8.0)),
                )
              ],
            ),
          ),
          // 客队
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            decoration: BoxDecoration(
                border:
                    Border(right: BorderSide(width: 1.0, color: Colors.grey))),
            child: Column(
              children: <Widget>[
                Container(
                  width: 27.0,
                  height: 27.0,
                  child: Image.network(item['vTeamData']['flag']),
                ),
                Container(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Text(item['vTeamData']['teamName']))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildMoreBtn() {
    return Container(
      width: 100.0,
      child: Center(
        child:
            Text('更多赛事', style: TextStyle(color: Colors.red, fontSize: 12.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List renderList = MatchUtil.formatGameList(matchList, false, 'football', null);
    // TODO: implement build
    return new Flexible(
      child: Container(
        height: 79.0,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 5.0, color: Colors.grey))),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: renderList == null ? 0 : renderList.length + 1,
          itemBuilder: (context, index) {
            if (index == renderList.length) {
              return _buildMoreBtn();
            } else {
              return _buildItem(renderList[index]);
            }
          },
        ),
      ),
    );
  }
}
