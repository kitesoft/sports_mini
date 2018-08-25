import 'package:flutter/material.dart';

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
      'icon': 'https://statics.itc.cn/football/leagueicon/17.png',
      'name': '英超',
      'link': '/z/football/17'
    },
    {
      'icon': 'https://statics.itc.cn/football/leagueicon/8.png',
      'name': '西甲',
      'link': '/z/football/8'
    },
    {
      'icon': 'https://statics.itc.cn/football/leagueicon/23.png',
      'name': '意甲',
      'link': '/z/football/23'
    },
    {
      'icon': 'https://statics.itc.cn/football/leagueicon/35.png',
      'name': '德甲',
      'link': '/z/football/35'
    },
    {
      'icon': 'https://statics.itc.cn/football/leagueicon/34.png',
      'name': '法甲',
      'link': '/z/football/34'
    }
  ];
  @override
  Widget build(BuildContext context) {
    Widget _getRowWidget(item) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30.0,
              height: 30.0,
              child: Image.network(item['icon'])
            ),
            Container(
              margin: EdgeInsets.only(left: 18.0),
              child: Text('${item["name"]}')
            )
            
          ],
        )
      );
    }

    List<Widget> _getItem() {
      return menuList.map((item) {
        return new Container(
          child: _getRowWidget(item),
        );
      }).toList();
    }

    return ListView(
      children: _getItem(),
    );
  }
}
