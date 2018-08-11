import 'package:flutter/material.dart';
import '../components/live-schedule.dart';
import '../components/feed-list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            // 顶部 header
            Container(
                height: 44.0,
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, color: Colors.grey),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 30.0,
                          height: 30.0,
                          child: FadeInImage.assetNetwork(
                            placeholder: '/images/preload.png',
                            image:
                                'https://statics.itc.cn/football/leagueicon/17.png',
                          ),
                        ),
                        Text('英超')
                      ],
                    ))
                  ],
                )),
            // 导航栏 start
            Container(
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey[300]))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Text(
                      '要闻',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Container(
                    child: Text('赛程'),
                  ),
                  Container(
                    child: Text('积分'),
                  ),
                  Container(
                    child: Text('射手'),
                  ),
                  Container(
                    child: Text('助攻'),
                  )
                ],
              ),
            ),
            // 导航栏 end
            // 热门赛事
            Expanded(
              child: ListView(
                children: <Widget>[
                  LiveSchedule(),
                  FeedList(),
                ],
              ),
            )
          ],
        ));
  }
}
