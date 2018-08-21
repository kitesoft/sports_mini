import 'package:flutter/material.dart';

class TeamItem extends StatefulWidget {
  @override
  _TeamItemState createState() => _TeamItemState();
}

class _TeamItemState extends State<TeamItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
        child: Row(
      children: [
        Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[Text('1'), Icon(Icons.av_timer), Text('曼城')],
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
}
