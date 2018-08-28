import 'package:flutter/material.dart';

class MatchItem extends StatefulWidget {
  MatchItem(@required this.match);
  final match;
  @override
  _MatchItemState createState() => _MatchItemState();
}

class _MatchItemState extends State<MatchItem> {
  // 生成 Item Widget
  Container _buildItemWidget(item) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Column(children: [
                Container(
                  width: 50.0, height: 50.0,
                  child: Image.network(item['hTeamData']['flag']),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(item['hTeamData']['teamName'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                  )
                )
              ]),
            ),
            Expanded(
              flex: 4,
              child: Column(children: [
                Text('英超第二轮', style: TextStyle(color: Colors.grey),),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('3 - 2', style: TextStyle(fontSize: 19.0)),
                ),
                Container(
                  width: 55.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.blue
                  ),
                  child: Center(
                    child: Text('已结束',style: TextStyle(fontSize: 10.0, color: Colors.white),textAlign: TextAlign.center)
                  )
                )
              ]),
            ),
            Expanded(
              flex: 3,
              child: Column(children: [
                Container(
                  width: 50.0, height: 50.0,
                  child: Image.network(item['vTeamData']['flag']),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(item['hTeamData']['teamName'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                  )
                )
              ]),
            )
            
            
          ],
        ));
  }

  List<Widget> _buildGames() {
    List games = widget.match['games'];
      return games.map((item) {
        return _buildItemWidget(item);
      }).toList();
    }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 36.0,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.date_range),
              Text(widget.match['date']),
              Text(widget.match['week'])
            ],
          )),
      Column(
        children: _buildGames()
      )
    ]);
  }
}
