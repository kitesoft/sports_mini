import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  FeedItem(@required this.feed);
  final feed;
  // 方便开发的 border
  BoxDecoration devBorder() {
    return new BoxDecoration(
      border:new Border.all(
          color:const Color(0xff6d999b),
      )
    );
  }

  @override
  _FeedItem createState() => new _FeedItem();
}

class _FeedItem extends State<FeedItem> {
  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var resComp;
    int showType = int.parse(widget.feed['showType']);
    final avaWidth = MediaQuery.of(context).size.width;
    Map bigImgSize = {
      'width': avaWidth - 15.0 * 2,
      'height': (avaWidth - 15.0 * 2) * 3 / 4
    };

    if (showType == 1) {
      // 纯文本
      resComp = Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsetsDirectional.only(bottom: 7.5),
                child: Text(
                    '五大联赛新赛季，你pick的球队还是那家赞助商吗？（附国内观赛指南）五大联赛新赛季，你pick的球队还是那家赞助商吗？（附国内观赛指南）',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18.0, height: 1.3))),
            Row(
              children: <Widget>[
                Text(
                  '百知K100',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
    } else if (showType == 2 || showType == 3) {
      // 图文混排
      resComp = Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: [
              Container(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsetsDirectional.only(bottom: 15.0),
                          child: Text(
                            '葡足协密切关注穆帅动向 一旦下课立即聘请狂人葡足协密切关注穆帅动向 一旦下课立即聘请狂人',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 17.0, height: 1.3),
                          )),
                      Row(
                        children: [
                          Text('足坛欧美汇', style: TextStyle(fontSize: 12.0, color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 112.0,
                height: 74.0,
                child: FadeInImage.assetNetwork(
                  placeholder: '/images/preload.png',
                  image:
                      'https://5b0988e595225.cdn.sohucs.com/q_70,c_lfill,w_228,h_148,g_faces/images/20180812/a32fc5222d40478bac50e30b3284f3e6.jpg',
                ),
              )
            ],
          ));
    } else if (showType == 5) {
      // 视频
      resComp = Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsetsDirectional.only(bottom: 7.5),
                child: Text(
                    '五大联赛新赛季，你pick的球队还是那家赞助商吗？（附国内观赛指南）五大联赛新赛季，你pick的球队还是那家赞助商吗？（附国内观赛指南）',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18.0, height: 1.3))
            ),
            Container(
              width: bigImgSize['width'],
              margin: EdgeInsets.only(bottom: 8.0),
              height: 196.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new NetworkImage('https://5b0988e595225.cdn.sohucs.com/q_70,c_lfill,w_750,h_420,g_faces/images/20180814/b19c8ebc7b2b4219a990f728f6ca91ef.jpeg'))
              ),
              child: Icon(Icons.play_circle_outline, color: Colors.white, size: 60.0,),
            ),
            Row(
              children: <Widget>[
                Text(
                  '百知K100',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
    }
    return resComp;
  }
}
