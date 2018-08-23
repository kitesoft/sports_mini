import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import './match-item.dart';
import 'dart:async';
import '../_helper/match.dart';

class MatchList extends StatefulWidget {
  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  RefreshController _refreshController;
  List preList;
  List matchList = [
    {
      "dateTime": 1535731200000,
      "games": [
        {
          "gameCode": 14736313,
          "tournamentId": 17,
          "gameDateTime": 1535801400000,
          "gameDateFormat": "2018-09-01 19:30:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
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
        },
        {
          "gameCode": 14736301,
          "tournamentId": 17,
          "gameDateTime": 1535810400000,
          "gameDateFormat": "2018-09-01 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 43,
          "hTeamId": 30,
          "vTeamData": {
            "teamId": 43,
            "teamName": "富勒姆",
            "flag": "http://statics.itc.cn/football/teamicon/43.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 30,
            "teamName": "布莱顿",
            "flag": "http://statics.itc.cn/football/teamicon/30.png",
            "group": null
          }
        },
        {
          "gameCode": 14736307,
          "tournamentId": 17,
          "gameDateTime": 1535810400000,
          "gameDateFormat": "2018-09-01 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 60,
          "hTeamId": 38,
          "vTeamData": {
            "teamId": 60,
            "teamName": "伯恩茅斯",
            "flag": "http://statics.itc.cn/football/teamicon/60.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 38,
            "teamName": "切尔西",
            "flag": "http://statics.itc.cn/football/teamicon/38.png",
            "group": null
          }
        },
        {
          "gameCode": 14736309,
          "tournamentId": 17,
          "gameDateTime": 1535810400000,
          "gameDateFormat": "2018-09-01 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 45,
          "hTeamId": 7,
          "vTeamData": {
            "teamId": 45,
            "teamName": "南安普顿",
            "flag": "http://statics.itc.cn/football/teamicon/45.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 7,
            "teamName": "水晶宫",
            "flag": "http://statics.itc.cn/football/teamicon/7.png",
            "group": null
          }
        },
        {
          "gameCode": 14736311,
          "tournamentId": 17,
          "gameDateTime": 1535810400000,
          "gameDateFormat": "2018-09-01 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 59,
          "hTeamId": 48,
          "vTeamData": {
            "teamId": 59,
            "teamName": "哈德斯菲尔德",
            "flag": "http://statics.itc.cn/football/teamicon/59.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 48,
            "teamName": "埃弗顿",
            "flag": "http://statics.itc.cn/football/teamicon/48.png",
            "group": null
          }
        },
        {
          "gameCode": 14736319,
          "tournamentId": 17,
          "gameDateTime": 1535810400000,
          "gameDateFormat": "2018-09-01 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 3,
          "hTeamId": 37,
          "vTeamData": {
            "teamId": 3,
            "teamName": "狼队",
            "flag": "http://statics.itc.cn/football/teamicon/3.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 37,
            "teamName": "西汉姆联",
            "flag": "http://statics.itc.cn/football/teamicon/37.png",
            "group": null
          }
        }
      ]
    },
    {
      "dateTime": 1535385600000,
      "games": [
        {
          "gameCode": 14736291,
          "tournamentId": 17,
          "gameDateTime": 1535396400000,
          "gameDateFormat": "2018-08-28 03:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 33,
          "hTeamId": 35,
          "vTeamData": {
            "teamId": 33,
            "teamName": "热刺",
            "flag": "http://statics.itc.cn/football/teamicon/33.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 35,
            "teamName": "曼联",
            "flag": "http://statics.itc.cn/football/teamicon/35.png",
            "group": null
          }
        }
      ]
    },
    {
      "dateTime": 1535212800000,
      "games": [
        {
          "gameCode": 14736289,
          "tournamentId": 17,
          "gameDateTime": 1535214600000,
          "gameDateFormat": "2018-08-26 00:30:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 30,
          "hTeamId": 44,
          "vTeamData": {
            "teamId": 30,
            "teamName": "布莱顿",
            "flag": "http://statics.itc.cn/football/teamicon/30.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 44,
            "teamName": "利物浦",
            "flag": "http://statics.itc.cn/football/teamicon/44.png",
            "group": null
          }
        },
        {
          "gameCode": 14736297,
          "tournamentId": 17,
          "gameDateTime": 1535286600000,
          "gameDateFormat": "2018-08-26 20:30:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 7,
          "hTeamId": 24,
          "vTeamData": {
            "teamId": 7,
            "teamName": "水晶宫",
            "flag": "http://statics.itc.cn/football/teamicon/7.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 24,
            "teamName": "沃特福德",
            "flag": "http://statics.itc.cn/football/teamicon/24.png",
            "group": null
          }
        },
        {
          "gameCode": 14736285,
          "tournamentId": 17,
          "gameDateTime": 1535295600000,
          "gameDateFormat": "2018-08-26 23:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 6,
          "hTeamId": 43,
          "vTeamData": {
            "teamId": 6,
            "teamName": "伯恩利",
            "flag": "http://statics.itc.cn/football/teamicon/6.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 43,
            "teamName": "富勒姆",
            "flag": "http://statics.itc.cn/football/teamicon/43.png",
            "group": null
          }
        },
        {
          "gameCode": 14736293,
          "tournamentId": 17,
          "gameDateTime": 1535295600000,
          "gameDateFormat": "2018-08-26 23:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 38,
          "hTeamId": 39,
          "vTeamData": {
            "teamId": 38,
            "teamName": "切尔西",
            "flag": "http://statics.itc.cn/football/teamicon/38.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 39,
            "teamName": "纽卡斯尔",
            "flag": "http://statics.itc.cn/football/teamicon/39.png",
            "group": null
          }
        }
      ]
    },
    {
      "dateTime": 1535126400000,
      "games": [
        {
          "gameCode": 14736299,
          "tournamentId": 17,
          "gameDateTime": 1535196600000,
          "gameDateFormat": "2018-08-25 19:30:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 17,
          "hTeamId": 3,
          "vTeamData": {
            "teamId": 17,
            "teamName": "曼城",
            "flag": "http://statics.itc.cn/football/teamicon/17.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 3,
            "teamName": "狼队",
            "flag": "http://statics.itc.cn/football/teamicon/3.png",
            "group": null
          }
        },
        {
          "gameCode": 14736281,
          "tournamentId": 17,
          "gameDateTime": 1535205600000,
          "gameDateFormat": "2018-08-25 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 37,
          "hTeamId": 42,
          "vTeamData": {
            "teamId": 37,
            "teamName": "西汉姆联",
            "flag": "http://statics.itc.cn/football/teamicon/37.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 42,
            "teamName": "阿森纳",
            "flag": "http://statics.itc.cn/football/teamicon/42.png",
            "group": null
          }
        },
        {
          "gameCode": 14736283,
          "tournamentId": 17,
          "gameDateTime": 1535205600000,
          "gameDateFormat": "2018-08-25 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 48,
          "hTeamId": 60,
          "vTeamData": {
            "teamId": 48,
            "teamName": "埃弗顿",
            "flag": "http://statics.itc.cn/football/teamicon/48.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 60,
            "teamName": "伯恩茅斯",
            "flag": "http://statics.itc.cn/football/teamicon/60.png",
            "group": null
          }
        },
        {
          "gameCode": 14736287,
          "tournamentId": 17,
          "gameDateTime": 1535205600000,
          "gameDateFormat": "2018-08-25 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 61,
          "hTeamId": 59,
          "vTeamData": {
            "teamId": 61,
            "teamName": "卡迪夫",
            "flag": "http://statics.itc.cn/football/teamicon/61.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 59,
            "teamName": "哈德斯菲尔德",
            "flag": "http://statics.itc.cn/football/teamicon/59.png",
            "group": null
          }
        },
        {
          "gameCode": 14736295,
          "tournamentId": 17,
          "gameDateTime": 1535205600000,
          "gameDateFormat": "2018-08-25 22:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 3,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 31,
          "hTeamId": 45,
          "vTeamData": {
            "teamId": 31,
            "teamName": "莱斯特城",
            "flag": "http://statics.itc.cn/football/teamicon/31.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 45,
            "teamName": "南安普顿",
            "flag": "http://statics.itc.cn/football/teamicon/45.png",
            "group": null
          }
        }
      ]
    },
    {
      "dateTime": 1535817600000,
      "games": [
        {
          "gameCode": 14736315,
          "tournamentId": 17,
          "gameDateTime": 1535819400000,
          "gameDateFormat": "2018-09-02 00:30:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 39,
          "hTeamId": 17,
          "vTeamData": {
            "teamId": 39,
            "teamName": "纽卡斯尔",
            "flag": "http://statics.itc.cn/football/teamicon/39.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 17,
            "teamName": "曼城",
            "flag": "http://statics.itc.cn/football/teamicon/17.png",
            "group": null
          }
        },
        {
          "gameCode": 14736305,
          "tournamentId": 17,
          "gameDateTime": 1535891400000,
          "gameDateFormat": "2018-09-02 20:30:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 42,
          "hTeamId": 61,
          "vTeamData": {
            "teamId": 42,
            "teamName": "阿森纳",
            "flag": "http://statics.itc.cn/football/teamicon/42.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 61,
            "teamName": "卡迪夫",
            "flag": "http://statics.itc.cn/football/teamicon/61.png",
            "group": null
          }
        },
        {
          "gameCode": 14736303,
          "tournamentId": 17,
          "gameDateTime": 1535900400000,
          "gameDateFormat": "2018-09-02 23:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 35,
          "hTeamId": 6,
          "vTeamData": {
            "teamId": 35,
            "teamName": "曼联",
            "flag": "http://statics.itc.cn/football/teamicon/35.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 6,
            "teamName": "伯恩利",
            "flag": "http://statics.itc.cn/football/teamicon/6.png",
            "group": null
          }
        },
        {
          "gameCode": 14736317,
          "tournamentId": 17,
          "gameDateTime": 1535900400000,
          "gameDateFormat": "2018-09-02 23:00:00",
          "statusStr": "not_started",
          "status": 1,
          "group": null,
          "gameType": 1,
          "gameOrder": 4,
          "liveUrl": null,
          "vTeamScore": 0,
          "hTeamScore": 0,
          "vTeamId": 33,
          "hTeamId": 24,
          "vTeamData": {
            "teamId": 33,
            "teamName": "热刺",
            "flag": "http://statics.itc.cn/football/teamicon/33.png",
            "group": null
          },
          "hTeamData": {
            "teamId": 24,
            "teamName": "沃特福德",
            "flag": "http://statics.itc.cn/football/teamicon/24.png",
            "group": null
          }
        }
      ]
    }
  ];
  Widget _headerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(mode: mode);
  }

  Widget _footerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(
      mode: mode,
      refreshingText: 'loading...',
      idleIcon: const Icon(Icons.arrow_upward),
      idleText: 'Loadmore...',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _refreshController = new RefreshController();
    super.initState();
  }

  void _onRefresh(bool up) {
    if (up) {
      //headerIndicator callback
      new Future.delayed(const Duration(milliseconds: 2009)).then((val) {
        _refreshController.sendBack(true, RefreshStatus.completed);
      });
    } else {
      new Future.delayed(const Duration(milliseconds: 2009)).then((val) {
        _refreshController.sendBack(true, RefreshStatus.completed);
      });
    }
  }

  void _onOffsetCallback(bool up, double offset) {}

  List<Widget> _getMatchItem() {
    List formartList = MatchUtil.formatMatchList(matchList, 'football');
    return formartList.map((match) {
      return MatchItem(match);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        onOffsetChange: _onOffsetCallback,
        headerBuilder: _headerCreate,
        footerBuilder: _footerCreate,
        controller: _refreshController,
        child: ListView(
          children: _getMatchItem()
        ));
  }
}
