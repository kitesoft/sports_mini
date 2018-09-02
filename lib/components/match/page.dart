import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../common/tabs.dart';

class MatchPage extends StatefulWidget {
  MatchPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  _getMatchData() async {}
  // 方便开发的 border
  BoxDecoration devBorder() {
    return new BoxDecoration(
        border: new Border.all(
      color: const Color(0xff6d999b),
    ));
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
      gradient = null;
    }
    return gradient;
  }

  final Map matchData = {
    "gameCode": 14736313,
    "tournamentId": 17,
    "gameDateTime": 1535801400000,
    "gameDateFormat": "2018-09-01 19:30:00",
    "statusStr": "closed",
    "status": 4,
    "group": null,
    "gameType": 1,
    "gameOrder": 4,
    "liveUrl": null,
    "vTeamScore": 2,
    "hTeamScore": 1,
    "vTeamId": 44,
    "hTeamId": 31,
    "vTeamData": {
      "teamId": 44,
      "teamName": "利物浦",
      "flag": "http://statics.itc.cn/football/teamicon/44.png",
      "group": null
    },
    "hTeamData": {
      "teamId": 31,
      "teamName": "莱斯特城",
      "flag": "http://statics.itc.cn/football/teamicon/31.png",
      "group": null
    }
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(children: [
      Container(
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: Image.network(matchData['hTeamData']['flag']),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(matchData['hTeamData']['teamName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white)))
                    ]),
              ),
              // 对战信息
              Expanded(
                flex: 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '英超第二轮',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('3 - 2',
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
                            '已结束',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.white),
                          )))
                    ]),
              ),
              // 客队信息
              Expanded(
                flex: 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: Image.network(matchData['vTeamData']['flag']),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(matchData['vTeamData']['teamName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white)))
                    ]),
              )
            ],
          )),
      JTabs()
    ]));
  }
}
