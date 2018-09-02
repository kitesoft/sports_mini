import 'package:flutter/material.dart';
import '../components/feed-list.dart';

class JTabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<JTabs> {
  final String feedApi = 'https://v2.sohu.com/integration-api/mix/region/15';
  final Map feedParams = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 40.0,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    '赛况',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
                Container(
                  child: Text('数据'),
                ),
                Container(
                  child: Text('直播'),
                ),
                Container(
                  child: Text('聊球'),
                ),
              ],
            )),
        // FeedList(api: feedApi, params: feedParams)
      ],
    );
  }
}
