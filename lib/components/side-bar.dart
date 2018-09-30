import 'package:sports_mini/common/base.dart';
import 'package:sports_mini/store/index.dart';

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
      "icon": "//statics.itc.cn/football/leagueicon/sports.png",
      "name": "体育首页",
      "link": "//m.sohu.com/c/3/"
    },
    {
      "icon": "//statics.itc.cn/sports/basketball/NBA.png",
      "name": "NBA",
      "link": "/z/nba/home"
    },
    {
      "icon": "//statics.itc.cn/sports/basketball/CBA.png",
      "name": "CBA",
      "link": "/z/cba/home"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/17.png",
      "name": "中超",
      "link": ""
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/17.png",
      "name": "亚冠",
      "link": ""
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/17.png",
      "name": "中甲",
      "link": ""
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/17.png",
      "name": "英超",
      "link": "/z/football/17"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/8.png",
      "name": "西甲",
      "link": "/z/football/8"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/23.png",
      "name": "意甲",
      "link": "/z/football/23"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/35.png",
      "name": "德甲",
      "link": "/z/football/35"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/34.png",
      "name": "法甲",
      "link": "/z/football/34"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/7.png",
      "name": "欧冠",
      "link": "/z/football/7"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/679.png",
      "name": "欧联",
      "link": "/z/football/679"
    },
    {
      "icon": "//statics.itc.cn/football/leagueicon/1.png",
      "name": "欧美男足",
      "link": "/z/football/1"
    },
    {
      "icon": "//statics.itc.cn/esports/icon/esports.png",
      "name": "电竞",
      "link": "/z/e_sport/home"
    }
  ];

  Widget _genItemWidget(item) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 30.0, height: 30.0, child: Image.network(item['icon'])),
            Container(
                margin: EdgeInsets.only(left: 18.0),
                child: Text('${item["name"]}'))
          ],
        ));
  }

  StoreConnector _genTabBar(context, item) {
    return new StoreConnector<AppState, VoidCallback>(
      builder: (BuildContext context, VoidCallback calback) {
        return new InkWell(onTap: calback, child: _genItemWidget(item));
      },
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(new SetCurLeagueAction(
              league: League.fromJson(leagueList[item['leagueId']])));
          Navigator.pop(context);
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _getItem() {
      return menuList.map((item) {
        return new Container(child: _genTabBar(context, item));
      }).toList();
    }

    return ListView(
      children: _getItem(),
    );
  }
}
