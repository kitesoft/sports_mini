import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:dio/dio.dart';
import 'package:sports_mini/common/loading.dart';
import 'package:sports_mini/_utils/util.dart';
//
import './format.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({
    @required this.newsId,
    @required this.authorId,
    this.title
  });
  final int newsId;
  final int authorId;
  final String title;
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Dio dio = new Dio();
  Map<String, dynamic> articleData;
  _getArticleDetail() async {
    final String reqUrl = 'https://d2.m.sohu.com/a/${widget.newsId}_${widget.authorId}.json';
    Response res = await dio.get(reqUrl, data: {});
    var dataList = res.data;
    dataList['fulltext']['content'] = FormatUtil.formatContent(dataList['fulltext']['content']);
    setState(() {
      articleData = dataList;
    });
  }
  @override
  void initState() {
    _getArticleDetail();
    super.initState();
  }
  
  // 标题
  Widget _buildTitle(String title) {
    return Container(
        padding:
            EdgeInsets.only(left: 18.5, right: 18.5, top: 20.0, bottom: 0.0),
        child: Text(title,
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold, height: 1.2)));
  }

  // 作者信息
  Widget _buildAuthorInfo(Map author) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(right: 7.5),
            decoration: BoxDecoration(
              image: new DecorationImage(
                      image: new NetworkImage(Util.fixUrl(author['logo']))),
                borderRadius: BorderRadius.circular(18.0)),
            width: 36.0,
            height: 36.0,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              author['name'],
              style: TextStyle(fontSize: 16.0),
            ),
            Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Text(
                  '${author["joinDate"]}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                )),
          ]),
          Container(
              margin: EdgeInsets.only(left: 7.5),
              child: Image.asset('images/sohuhao.png',
                  width: 64.0, alignment: Alignment.topLeft))
        ]));
  }

  // 标签列表
  Widget _buildTagList(List list) {
    Widget _buildTag(Map tag) {
      return Container(
          height: 32.0,
          margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: Colors.grey),
          child: Text(tag['name'],
              style: TextStyle(
                  fontSize: 14.0,
                  height: 1.5 // TBD：通过微调实现的垂直居中，need2change2 code implement
                  )));
    }

    return Container(
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Wrap(
            children: list.map((tag) {
          return _buildTag(tag);
        }).toList()));
  }

  // 声明信息
  Widget _buildCopyright() {
    return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '声明：该文观点仅代表作者本人，搜狐号系信息发布平台，搜狐仅提供信息存储空间服务。',
          style: TextStyle(fontSize: 12.0, height: 1.5),
        ));
  }

  Widget _buildCommentArea() {
    return Column(children: [
      Container(
          padding: EdgeInsets.only(top: 35.0),
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          decoration: BoxDecoration(border: Border(top: BorderSide())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 30.0,
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 0.5)))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '用户评论',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 30.0,
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 0.5)))),
            ],
          )),
      Container(child: Text('comments', style: TextStyle(letterSpacing: 4.0))),
      // comment-list
      Container(height: 200.0, decoration: BoxDecoration(color: Colors.white30))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    String showTitle = widget.title == null  ? '文章页' : widget.title;
    Widget pageBody;
    if (articleData == null) {
      pageBody = BaseLoading();
    } else {
      pageBody = ListView(children: [
          _buildTitle(articleData['fulltext']['title']),
          _buildAuthorInfo(articleData['author']),
          new HtmlView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            data: articleData['fulltext']['content'],
          ),
          _buildTagList(articleData['fulltext']['tags']),
          _buildCopyright(),
          _buildCommentArea()
        ]);
    }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(showTitle),
        ),
        body: pageBody);
  }
}
