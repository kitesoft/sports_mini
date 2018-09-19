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
  });
  final int newsId;
  final int authorId;
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
  @override
  void didUpdateWidget(oldWidget) {
    _getArticleDetail();
    super.didUpdateWidget(oldWidget);
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
                  height: 1.6 // TBD：通过微调实现的垂直居中，need2change2 code implement
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
    String html =
        '<p>　　新京报快讯(记者 杨砺)9月17日，娃哈哈集团有限公司董事长兼总经理宗庆后在2018中国发展高层论坛专题研讨会上发表了对新时代中国消费市场崛起的看法，同时还表示，个税5000起征点依然太低，工薪阶层基本不征个税消费才拉动得起来。 </p> \n<p>由于长期以来我国基础差、底子薄，需要较大的投入搞基本建设，老百姓的收入增长比经济发展的速度慢。再加上中西部发展不均衡��许多地区至今还没脱贫，还有相当多的老百姓手里没有钱去消费，宗庆后称，中国工人辛辛苦苦加班加点生产的产品，在国内市场无法完全消化，只好低价出口到发达国家。 </p> \n<p>他指出，我们的政府企业要好好反思，如果把员工、把全国老百姓的收入提高了，大家都有钱消费自己的产品，我认为也不用依靠过度出口来拉动经济，也不会造成贸易摩擦。 </p> \n<p>“说明老百姓的收入确实在提高，提高的相当一部分变成税收又交给国家了，实际上收入并没有增加多少。”宗庆后称，今年全国居民人均可支配收入增长9.04%，税收总的增幅为10.74%，企业所得税增长11.3%，个人所得税总的增幅18.6%，今年1—7月份个人所得税征收9215亿元，同比增长20.6%。上半年社会消费品零售额同比净增长7.7%，是1995年以来的最低增速。 </p> \n<p>对于消费降级的说法，宗庆后认为，实际情况是相反的，我们的消费市场在升级”，“中国14亿人口当中，3—4亿是中产阶级，过着比较富裕的生活。”这部分人的物质生活已经比较丰富，房子、车子、高档消费品该有的都有了，开始向出国旅游、文化休闲等更高层次水平的发展。但是出国旅游、享受文化生活比买车子、买房子来的便宜，因此他们的消费额是下降的。 </p> \n<p>“实际老百姓税费的负担很重，实体经济的税费负担也很重，所以实体经济发展现在也比较困难，”宗庆后建议，现在要给企业减税，让企业给员工多增加收入，提高老百姓个税起征点，降低社保基金的费率，“5000起征点依然太低，工薪阶层基本不征个税消费才拉动得起来。 </p> \n<p>宗庆后建议，政府下决心过紧日子，进一步解放思想，少收点税，多分给老百姓一点，让老百姓消费。表面看来，国家税收可能会有点减少，但实际上是税基扩大了，税收不仅不会减少，反而会增加。 </p> \n<p>他还认为，地方政府不应该再扩大基建规模，而应把财政收入用在老百姓上，用在民生上。同时，他建议取消土地财政;让教育和医疗卫生回归到事业，不能当成产业来经营。同时建设一些经济适用房，满足刚需住房问题。 </p> \n<p>他还建议，“中央政府对地方政府的考核不光是考核GDP，一定要考核老百姓是否安居乐业，老百姓是不是满意，老百姓的幸福感是怎么样，这样政府才能真正为老百姓着想。” </p> \n<p>作者：杨砺</p>';
    // String markdown = html2md.convert(html);
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
          title: new Text('文章页'),
        ),
        body: pageBody);
  }
}
