import 'package:flutter/material.dart';

class StandingTeams extends StatefulWidget {
  @override
  _StandingTeamsState createState() => _StandingTeamsState();
}

class _StandingTeamsState extends State<StandingTeams> {
  List teamList = [
    {
      "teamInfo": {
        "teamId": 17,
        "teamName": "曼城",
        "flag": "http://statics.itc.cn/football/teamicon/17.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 2,
      "losses": 0,
      "ties": 0,
      "points": 6,
      "gDiff": 7,
      "place": 1,
      "goals": 8,
      "goalsAgainst": 1
    },
    {
      "teamInfo": {
        "teamId": 44,
        "teamName": "利物浦",
        "flag": "http://statics.itc.cn/football/teamicon/44.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 2,
      "losses": 0,
      "ties": 0,
      "points": 6,
      "gDiff": 6,
      "place": 2,
      "goals": 6,
      "goalsAgainst": 0
    },
    {
      "teamInfo": {
        "teamId": 38,
        "teamName": "切尔西",
        "flag": "http://statics.itc.cn/football/teamicon/38.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 2,
      "losses": 0,
      "ties": 0,
      "points": 6,
      "gDiff": 4,
      "place": 3,
      "goals": 6,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 24,
        "teamName": "沃特福德",
        "flag": "http://statics.itc.cn/football/teamicon/24.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 2,
      "losses": 0,
      "ties": 0,
      "points": 6,
      "gDiff": 4,
      "place": 4,
      "goals": 5,
      "goalsAgainst": 1
    },
    {
      "teamInfo": {
        "teamId": 33,
        "teamName": "热刺",
        "flag": "http://statics.itc.cn/football/teamicon/33.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 2,
      "losses": 0,
      "ties": 0,
      "points": 6,
      "gDiff": 3,
      "place": 5,
      "goals": 5,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 60,
        "teamName": "伯恩茅斯",
        "flag": "http://statics.itc.cn/football/teamicon/60.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 2,
      "losses": 0,
      "ties": 0,
      "points": 6,
      "gDiff": 3,
      "place": 6,
      "goals": 4,
      "goalsAgainst": 1
    },
    {
      "teamInfo": {
        "teamId": 48,
        "teamName": "埃弗顿",
        "flag": "http://statics.itc.cn/football/teamicon/48.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 1,
      "losses": 0,
      "ties": 1,
      "points": 4,
      "gDiff": 1,
      "place": 7,
      "goals": 4,
      "goalsAgainst": 3
    },
    {
      "teamInfo": {
        "teamId": 31,
        "teamName": "莱斯特城",
        "flag": "http://statics.itc.cn/football/teamicon/31.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 1,
      "losses": 1,
      "ties": 0,
      "points": 3,
      "gDiff": 1,
      "place": 8,
      "goals": 3,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 35,
        "teamName": "曼联",
        "flag": "http://statics.itc.cn/football/teamicon/35.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 1,
      "losses": 1,
      "ties": 0,
      "points": 3,
      "gDiff": 0,
      "place": 9,
      "goals": 4,
      "goalsAgainst": 4
    },
    {
      "teamInfo": {
        "teamId": 7,
        "teamName": "水晶宫",
        "flag": "http://statics.itc.cn/football/teamicon/7.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 1,
      "losses": 1,
      "ties": 0,
      "points": 3,
      "gDiff": 0,
      "place": 10,
      "goals": 2,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 30,
        "teamName": "布莱顿",
        "flag": "http://statics.itc.cn/football/teamicon/30.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 1,
      "losses": 1,
      "ties": 0,
      "points": 3,
      "gDiff": -1,
      "place": 11,
      "goals": 3,
      "goalsAgainst": 4
    },
    {
      "teamInfo": {
        "teamId": 45,
        "teamName": "南安普顿",
        "flag": "http://statics.itc.cn/football/teamicon/45.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 1,
      "ties": 1,
      "points": 1,
      "gDiff": -1,
      "place": 12,
      "goals": 1,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 39,
        "teamName": "纽卡斯尔",
        "flag": "http://statics.itc.cn/football/teamicon/39.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 1,
      "ties": 1,
      "points": 1,
      "gDiff": -1,
      "place": 12,
      "goals": 1,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 3,
        "teamName": "狼队",
        "flag": "http://statics.itc.cn/football/teamicon/3.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 1,
      "ties": 1,
      "points": 1,
      "gDiff": -2,
      "place": 14,
      "goals": 2,
      "goalsAgainst": 4
    },
    {
      "teamInfo": {
        "teamId": 6,
        "teamName": "伯恩利",
        "flag": "http://statics.itc.cn/football/teamicon/6.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 1,
      "ties": 1,
      "points": 1,
      "gDiff": -2,
      "place": 15,
      "goals": 1,
      "goalsAgainst": 3
    },
    {
      "teamInfo": {
        "teamId": 61,
        "teamName": "卡迪夫",
        "flag": "http://statics.itc.cn/football/teamicon/61.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 1,
      "ties": 1,
      "points": 1,
      "gDiff": -2,
      "place": 16,
      "goals": 0,
      "goalsAgainst": 2
    },
    {
      "teamInfo": {
        "teamId": 42,
        "teamName": "阿森纳",
        "flag": "http://statics.itc.cn/football/teamicon/42.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 2,
      "ties": 0,
      "points": 0,
      "gDiff": -3,
      "place": 17,
      "goals": 2,
      "goalsAgainst": 5
    },
    {
      "teamInfo": {
        "teamId": 43,
        "teamName": "富勒姆",
        "flag": "http://statics.itc.cn/football/teamicon/43.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 2,
      "ties": 0,
      "points": 0,
      "gDiff": -4,
      "place": 18,
      "goals": 1,
      "goalsAgainst": 5
    },
    {
      "teamInfo": {
        "teamId": 37,
        "teamName": "西汉姆联",
        "flag": "http://statics.itc.cn/football/teamicon/37.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 2,
      "ties": 0,
      "points": 0,
      "gDiff": -5,
      "place": 19,
      "goals": 1,
      "goalsAgainst": 6
    },
    {
      "teamInfo": {
        "teamId": 59,
        "teamName": "哈德斯菲尔德",
        "flag": "http://statics.itc.cn/football/teamicon/59.png",
        "group": "default"
      },
      "teamId": 0,
      "wins": 0,
      "losses": 2,
      "ties": 0,
      "points": 0,
      "gDiff": -8,
      "place": 20,
      "goals": 1,
      "goalsAgainst": 9
    }
  ];

  Container _buildTitleSection() {
    return Container(
            color: Colors.grey,
            height: 36.0,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text('球队'),
                ),
                Expanded(
                  flex: 7,
                  child: Row(children: [
                    Expanded(
                      flex: 18,
                      child: Text('场', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      flex: 33,
                      child: Text('胜平负', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      flex: 34,
                      child: Text('进/净胜', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      flex: 15,
                      child: Text('积分', textAlign: TextAlign.center),
                    ),
                  ]),
                )
              ],
            ));
  }

  Container _getItemWidget(item) {
    return Container(
        height: 50.0,
        color: item['bg'],
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Text(item['rank']),
                    Icon(Icons.av_timer),
                    Text(item['teamInfo']['teamName'], softWrap: true)
                  ],
                )),
            Expanded(
              flex: 7,
              child: Row(children: [
                Expanded(
                  flex: 18,
                  child: Text('2', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 33,
                  child: Text('2/0/0', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 34,
                  child: Text('8/7', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 15,
                  child: Text('6', textAlign: TextAlign.center),
                ),
              ]),
            )
          ],
        ));
  }

  List<Widget> _getTeamItem() {
    Color bg;
    List formatList = [];
    var item;
    for (var i = 0; i < teamList.length; i++) {
      item = teamList[i];
      if (i % 2 == 1) {
        bg = Colors.grey;
      } else {
        bg = Colors.white;
      }
      item['bg'] = bg;
      item['rank'] = (i + 1).toString();
      formatList.add(item);
    }
    return formatList.map((item) {
      return new Container(
        child: _getItemWidget(item),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTitleSection(),
        Container(
            child: Column(
          children: _getTeamItem(),
        )),
        //
      ],
    );
  }
}
