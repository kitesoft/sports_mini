import 'package:sports_mini/common/base.dart';
//
import '../team/page.dart';

class MatchPage extends StatefulWidget {
  MatchPage({Key key, @required this.leagueId, @required this.gameCode})
      : super(key: key);

  final String leagueId;
  final String gameCode;
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  Dio dio = new Dio();
  Map matchData;
  _getMatchData() async {
    String reqUrl =
        'http://v2.sohu.com/sports-data/football/${widget.leagueId}/games/${widget.gameCode}';
    Response res = await dio.get(reqUrl, data: null);
    var data = res.data != null ? res.data : {};
    setState(() {
      matchData = data;
    });
  }

  @override
  void initState() {
    _getMatchData();
    super.initState();
  }

  _buildStatusGradient(int status) {
    LinearGradient gradient;
    // 已结束
    if (status == 3 || status == 4) {
      gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.0,
            1.0
          ],
          colors: [
            Color.fromRGBO(189, 189, 189, 0.5),
            Color.fromRGBO(72, 72, 72, 1.0),
          ]);
    } else if (status == 2) {
      gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.0,
            1.0
          ],
          colors: [
            Color.fromRGBO(189, 189, 189, 0.5),
            Color.fromRGBO(72, 72, 72, 1.0),
          ]);
    } else {
      gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.0,
            1.0
          ],
          colors: [
            Color.fromRGBO(189, 189, 189, 0.5),
            Color.fromRGBO(72, 72, 72, 1.0),
          ]);
    }
    return gradient;
  }

  Widget _buildPageBody(BuildContext context) {
    return Column(children: [
      Container(
          height: 150.0,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('images/stadium_bg.png'),
                  fit: BoxFit.cover)),
          child: Row(
            children: [
              // 主队信息
              Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                        return new TeamPage(
                            leagueId: widget.leagueId, teamId: matchData['hTeamId']);
                      }));
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            child:
                                Image.network(matchData['hTeamData']['flag']),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text(matchData['hTeamData']['teamName'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white)))
                        ]),
                  )),
              // 对战信息
              Expanded(
                flex: 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '英超第二轮',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('3 - 2',
                            style:
                                TextStyle(fontSize: 19.0, color: Colors.white)),
                      ),
                      Container(
                          width: 60.0,
                          height: 18.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.blue,
                              gradient: _buildStatusGradient(3)),
                          child: Center(
                              child: Text(
                            '已结束',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.white),
                          )))
                    ]),
              ),
              // 客队信息
              Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(new PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                        return new TeamPage(
                            leagueId: widget.leagueId, teamId: matchData['vTeamId']);
                      }));
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            child:
                                Image.network(matchData['vTeamData']['flag']),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text(matchData['vTeamData']['teamName'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white)))
                        ]),
                  ))
            ],
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var pageBody = BaseLoading();
    if (matchData != null) {
      pageBody = _buildPageBody(context);
    }
    String title = matchData != null ? matchData['hTeamData']['teamName'] + ' vs ' + matchData['vTeamData']['teamName'] : '';
    return Scaffold(
        appBar: new AppBar(
          // 去掉导航栏下面的阴影
          elevation: 0.0,
          title: new Text(title),
        ),
        body: pageBody);
  }
}
