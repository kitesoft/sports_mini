import 'package:flutter/material.dart';

class MatchItem extends StatefulWidget {
  @override
  _MatchItemState createState() => _MatchItemState();
}

class _MatchItemState extends State<MatchItem> {
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
              Text('08-19'),
              Text('星期日')
            ],
          )),
      Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Column(children: [
                Container(width: 50.0, height: 50.0, color: Colors.green),
                Container(child: Text('切尔西'))
              ]),
              Column(children: [
                Text('英超第二轮'),
                Text('3 - 2'),
                Container(color: Colors.grey, child: Text('已结束'))
              ]),
              Column(children: [
                Container(width: 50.0, height: 50.0, color: Colors.green),
                Container(child: Text('切尔西'))
              ]
            ),
          ],
        )
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Column(children: [
                Container(width: 50.0, height: 50.0, color: Colors.green),
                Container(child: Text('切尔西'))
              ]),
              Column(children: [
                Text('英超第二轮'),
                Text('3 - 2'),
                Container(color: Colors.grey, child: Text('已结束'))
              ]),
              Column(children: [
                Container(width: 50.0, height: 50.0, color: Colors.green),
                Container(child: Text('切尔西'))
              ]
            ),
          ],
        )
      )
    ]);
  }
}
