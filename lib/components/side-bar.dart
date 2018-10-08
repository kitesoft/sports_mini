import 'package:sports_mini/common/base.dart';
import './home/page.dart';

class SideBar extends StatefulWidget {
  SideBar({Key key, this.league}) : super(key: key);
  final League league;
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
  String str = '';
  List menuList = [
    {
      "icon": "https://statics.itc.cn/football/leagueicon/17.png",
      "name": "英超",
      "link": "native-football-17",
      "leagueId": 17
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/8.png",
      "name": "西甲",
      "link": "native-football-8",
      "leagueId": 8
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/23.png",
      "name": "意甲",
      "link": "native-football-23",
      "leagueId": 23
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/35.png",
      "name": "德甲",
      "link": "native-football-35",
      "leagueId": 35
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/34.png",
      "name": "法甲",
      "link": "native-football-34",
      "leagueId": 34
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/7.png",
      "name": "欧冠",
      "link": "native-football-7",
      "leagueId": 7
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/679.png",
      "name": "欧联",
      "link": "native-football-679",
      "leagueId": 679
    },
    {
      "icon": "https://statics.itc.cn/football/leagueicon/1.png",
      "name": "欧美男足",
      "link": "native-football-1",
      "leagueId": 1
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

  _openHomePage(BuildContext context, Map tab) {
    int leagueId = tab['leagueId'];
    League _league;
    Navigator.pop(context);
    // print(leagueList[leagueId].toString());
    if (leagueId != null && leagueList[leagueId] != null) {
      _league = League.fromJson(leagueList[leagueId]);
    } else {
      return;
    }
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new HomePage(
        title: _league.name,
        league: _league,
      )),
    );
  }

  Widget _genTabBar(context, item) {
    return InkWell(
        onTap: () {
          _openHomePage(context, item);
        },
        child: _genItemWidget(item));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _getItem() {
      List _pre = menuList.where((i) => i['id'] != widget.league.id).toList();
      return _pre.map((item) {
        return new Container(child: _genTabBar(context, item));
      }).toList();
    }

    return ListView(children: _getItem());
  }
}
