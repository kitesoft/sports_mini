import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  FeedItem(@required this.feed);
  final feed;

  @override
  _FeedItem createState() => new _FeedItem();
}

class _FeedItem extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint(widget.feed.toString());
    return Container(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '葡足协密切关注穆帅动向 一旦下课立即聘请狂人',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    Row(
                      children: [
                        Text('足坛欧美汇', style: TextStyle(fontSize: 10.0))
                      ],
                    )
                  ],
                ),
              )),
              Container(
                width: 112.0,
                height: 74.0,
                color: Colors.grey[300],
              )
            ],
          )),
    );
  }
}
