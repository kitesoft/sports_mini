import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
//
import 'package:sports_mini/model/league.dart';
import 'package:sports_mini/store/state.dart';
import 'package:sports_mini/store/actions.dart';
//
import '../store/data/leagues.dart';

class SideBar extends StatefulWidget {
  SideBar({Key key}) : super(key: key);
  // 方便开发的 border
  BoxDecoration devBorder() {
    return new BoxDecoration(
        border: new Border.all(
      color: const Color(0xff6d999b),
    ));
  }

  @override
  _SideBar createState() => new _SideBar();
}

class _SideBar extends State<SideBar> {
  List menuList = [
    {
      'leagueId': '17',
      'icon': 'https://statics.itc.cn/football/leagueicon/17.png',
      'name': '英超',
      'link': '/z/football/17'
    },
    {
      'leagueId': '8',
      'icon': 'https://statics.itc.cn/football/leagueicon/8.png',
      'name': '西甲',
      'link': '/z/football/8'
    },
    {
      'leagueId': '23',
      'icon': 'https://statics.itc.cn/football/leagueicon/23.png',
      'name': '意甲',
      'link': '/z/football/23'
    },
    {
      'leagueId': '35',
      'icon': 'https://statics.itc.cn/football/leagueicon/35.png',
      'name': '德甲',
      'link': '/z/football/35'
    },
    {
      'leagueId': '34',
      'icon': 'https://statics.itc.cn/football/leagueicon/34.png',
      'name': '法甲',
      'link': '/z/football/34'
    }
  ];

  Widget _genItemWidget(item) {
    return  Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 30.0,
                          height: 30.0,
                          child: Image.network(item['icon'])),
                      Container(
                          margin: EdgeInsets.only(left: 18.0),
                          child: Text('${item["name"]}'))
                    ],
                  ));
  }

  StoreConnector _genTabBar(context, item) {
    return new StoreConnector<AppState, VoidCallback>(
        builder: (BuildContext context, VoidCallback calback) {
          return new InkWell(
              onTap: calback,
              child: _genItemWidget(item)
          );
        },
        converter: (Store<AppState> store) {
          return (){
            store.dispatch(
              new SetCurLeagueAction(
                  league: League.fromJson(leagueList[item['leagueId']])
                )
            );
            Navigator.pop(context);
          };
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _getItem() {
      return menuList.map((item) {
        return new Container(
          child: _genTabBar(context, item)
        );
      }).toList();
    }

    return ListView(
      children: _getItem(),
    );
  }
}
