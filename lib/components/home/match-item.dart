import 'package:sports_mini/common/base.dart';
//
import '../match/page.dart';


class MatchItem extends StatelessWidget {
  MatchItem({@required this.match, this.leagueId});
  final Map match;
  final String leagueId;
  // 生成 Item Widget
  Widget _buildItemWidget(BuildContext context, Map item) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
              (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
            return new MatchPage(
                leagueId: leagueId, gameCode: item['gameCode']);
          }));
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Image.network(item['hflag']),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(item['hname'],
                            maxLines: 1, overflow: TextOverflow.ellipsis))
                  ]),
                ),
                Expanded(
                  flex: 4,
                  child: Column(children: [
                    Text(
                      item['title'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(item['progressShow'],
                          style: TextStyle(fontSize: 19.0)),
                    ),
                    Container(
                        width: 55.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.blue),
                        child: Center(
                            child: Text(
                                item['statusShow'],
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.white),
                                textAlign: TextAlign.center)))
                  ]),
                ),
                Expanded(
                  flex: 3,
                  child: Column(children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: Image.network(item['vflag']),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(item['vname'],
                            maxLines: 1, overflow: TextOverflow.ellipsis))
                  ]),
                )
              ],
            )));
  }

  List<Widget> _buildGames(BuildContext context) {
    List games = this.match['games'];
    return games.map((item) {
      return _buildItemWidget(context, item);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 36.0,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.date_range),
              Text(this.match['date']),
              Text(this.match['week'])
            ],
          )),
      Column(children: _buildGames(context))
    ]);
  }
}
