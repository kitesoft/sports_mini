import 'package:sports_mini/common/base.dart';

class StandingTeams extends StatefulWidget {
  StandingTeams({
    @required this.league
  });
  final League league;
  @override
  _StandingTeamsState createState() => _StandingTeamsState();
}

class _StandingTeamsState extends State<StandingTeams> {
  List teamList;

  Dio dio = new Dio();

  _getTeamsData() async {
    final leagueId = widget.league.id;
    if (leagueId == null || !mounted) return;
    final url = 'https://v2.sohu.com/sports-data/football/$leagueId/standings/teams';
    Response res = await dio.get(url, data: {});
    List dataList = res.data != null ? res.data['default'] : [];
    setState(() {
      teamList = dataList;
    });
  }

  @override
  void initState() {
    _getTeamsData();
    super.initState();
  }

  Container _buildTitleSection() {
    return Container(
        color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: 36.0,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text('球队'),
            ),
            Expanded(
              flex: 6,
              child: Row(children: [
                Expanded(
                  flex: 18,
                  child: Text('场', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 33,
                  child: Text('胜平负', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 34,
                  child: Text('进/净胜', textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 15,
                  child: Text('积分', textAlign: TextAlign.center),
                ),
              ]),
            )
          ],
        ));
  }

  Container _getItemWidget(item) {
    return Container(
        height: 50.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        color: item['bg'],
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 18.0,
                      child: Text(item['rank'], textAlign: TextAlign.center),
                    ),
                    Container(
                      width: 13.0,
                      height: 13.0,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'images/preload.png',
                        image: item['teamInfo']['flag'],
                      ),
                    ),
                    Container(
                        width: 6 * 12.0,
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text(
                          item['teamInfo']['teamName'],
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                )),
            Expanded(
              flex: 6,
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

  List _getTeamItem() {
    Color bg;
    List formatList = [];
    var item;
    if (teamList == null) return [];
    for (var i = 0; i < teamList.length; i++) {
      item = teamList[i];
      if (i % 2 == 1) {
        bg = Colors.grey;
      } else {
        bg = Colors.white;
      }
      item['bg'] = bg;
      item['rank'] = (i + 1).toString();
      formatList.add(item);
    }
    return formatList;
  }

  @override
  Widget build(BuildContext context) {
    var formatList = _getTeamItem();
    Widget teams;
    if (formatList.length == 0) {
      teams = BaseLoading();
    } else {
      teams = ListView.builder(
        itemCount: formatList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildTitleSection();
          } else {
            return _getItemWidget(formatList[index - 1]);
          }
        },
      );
    }
    return JScroll(
      child: teams,
      pull: _getTeamsData
    );
  }
}
