import 'package:flutter/material.dart';

class LiveSchedule extends StatefulWidget {
  LiveSchedule({Key key}) : super(key: key);

  @override
  _LiveSchedule createState() => new _LiveSchedule();
}

class _LiveSchedule extends State<LiveSchedule> {
  Container _buildItem() {
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
                  child: Image.network(
                      'https://statics.itc.cn/football/teamicon/35.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('曼联')
                )
              ],
            ),
          ),
          // 详情
          Container(
            child: Column(
              children: <Widget>[
                Text('英超第一轮', style: TextStyle(fontSize: 7.0)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
                  child: Text('2 - 1', style: TextStyle(fontSize: 13.0)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500]),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Text('已结束', style: TextStyle(fontSize: 8.0)),
                )
              ],
            ),
          ),
          // 客队
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            decoration: BoxDecoration(
                border: Border(right: BorderSide(width: 1.0, color: Colors.grey))),
            child: Column(
              children: <Widget>[
                Container(
                  width: 27.0,
                  height: 27.0,
                  child: Image.network(
                      'https://statics.itc.cn/football/teamicon/31.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text('莱斯特城')
                )
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
        child: Text('更多赛事',style: TextStyle(color: Colors.red, fontSize: 12.0)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 79.0,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 5.0, color: Colors.grey))),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildItem(),
          _buildItem(),
          _buildItem(),
          _buildItem(),
          _buildItem(),
          _buildMoreBtn()
        ],
      ),
    );
  }
}
