import 'package:sports_mini/common/base.dart';

class FeedItem extends StatelessWidget {
  FeedItem({@required this.feed});
  final Map feed;

  //
  _openArticlePage(BuildContext context, Map feed) {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new ArticlePage(
              authorId: feed['authorId'],
              newsId: feed['id'],
              title: feed['authorName'])),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var resComp;
    int showType = this.feed['type'];
    final avaWidth = MediaQuery.of(context).size.width;
    Map bigImgSize = {
      'width': avaWidth - 15.0 * 2,
      'height': (avaWidth - 15.0 * 2) * 3 / 4
    };

    if (showType == 1) {
      // 纯文本
      resComp = Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsetsDirectional.only(bottom: 7.5),
                child: Text(this.feed['title'],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18.0, height: 1.3))),
            Row(
              children: <Widget>[
                Text(
                  this.feed['authorName'],
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Row(
                  children: [
                    Container(
                      width: 10.0,
                      child: Text('·',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                    ),
                    Text(this.feed['showTime'],
                        style: TextStyle(fontSize: 12.0, color: Colors.grey))
                  ],
                )
              ],
            )
          ],
        ),
      );
    } else if (showType == 2 || showType == 3) {
      // 图文混排
      resComp = Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: [
              Container(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsetsDirectional.only(bottom: 15.0),
                          child: Text(
                            this.feed['title'],
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 17.0, height: 1.3),
                          )),
                      Row(
                        children: [
                          Text(this.feed['authorName'],
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey)),
                          Row(
                            children: [
                              Container(
                                width: 10.0,
                                child: Text('·',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey)),
                              ),
                              Text(this.feed['showTime'],
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 112.0,
                height: 74.0,
                child: Image.network(feed['picUrl']),
              )
            ],
          ));
    } else if (showType == 5) {
      // 视频
      resComp = Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsetsDirectional.only(bottom: 7.5),
                child: Text(this.feed['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18.0, height: 1.3))),
            Container(
              width: bigImgSize['width'],
              margin: EdgeInsets.only(bottom: 8.0),
              height: 196.0,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(feed['picUrl']))),
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 60.0,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  this.feed['authorName'],
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Container(
                  child: Text(this.feed['showTime'],
                      style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                )
              ],
            )
          ],
        ),
      );
    }
    return InkWell(
        onTap: () {
          this._openArticlePage(context, this.feed);
        },
        child: resComp);
  }
}
