import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class StandingAssists extends StatefulWidget {
  @override
  _StandingAssistsState createState() => _StandingAssistsState();
}

class _StandingAssistsState extends State<StandingAssists> {
  List playerList;
  Dio dio = new Dio();

  _getPlayersData() async {
    final url = 'https://v2.sohu.com/sports-data/football/17/standings/assists';
    Response res = await dio.get(url, data: {});
    var dataList = res.data == null ? [] : res.data;
    if (!mounted) return;
    setState(() {
      playerList = dataList;
    });
  }

  @override
  void initState() {
    _getPlayersData();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _getPlayersData();
    super.didUpdateWidget(oldWidget);
  }

  Container _buildTitleSection() {
    return Container(
        color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: 36.0,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text('球员'),
            ),
            Expanded(
              flex: 3,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Text('球队', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child: Text('助攻', textAlign: TextAlign.center),
                ),
              ]),
            )
          ],
        ));
  }

  Container _getItemWidget(item) {
    return Container(
        height: 50.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        color: item['bg'],
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 18.0,
                      child: Text(item['rank'], textAlign: TextAlign.center),
                    ),
                    Container(
                        width: 6 * 12.0,
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text(
                          item['playerName'],
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                )),
            Expanded(
              flex: 3,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Text(item['playerInfo']['teamInfo']['teamName'],
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 1,
                  child:
                      Text('${item["assists"]}', textAlign: TextAlign.center),
                ),
              ]),
            )
          ],
        ));
  }

  List _getPlayerItem() {
    Color bg;
    List formatList = [];
    var item;
    int trueRank = 1;
    int currentNum = 0;
    if (playerList == null) return [];
    for (var i = 0; i < playerList.length; i++) {
      item = playerList[i];
      // 处理排名
      if (currentNum == 0) {
        currentNum = item['goals'];
      }
      if (item['goals'] < currentNum) {
        currentNum = item['goals'];
        trueRank = i + 1;
      }
      item['rank'] = trueRank.toString();
      // 处理 bg
      if (i % 2 == 1) {
        bg = Colors.grey;
      } else {
        bg = Colors.white;
      }
      item['bg'] = bg;
      // 处理 playerName
      item['playerName'] = item['playerInfo']['playerName'] != null
          ? item['playerInfo']['playerName']
          : item['playerInfo']['otherName'];

      formatList.add(item);
    }
    return formatList;
  }

  @override
  Widget build(BuildContext context) {
    var formatList = _getPlayerItem();
    return ListView.builder(
      itemCount: formatList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildTitleSection();
        } else {
          return _getItemWidget(formatList[index - 1]);
        }
      },
    );
  }
}
