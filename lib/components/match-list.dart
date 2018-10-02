import 'package:sports_mini/common/base.dart';
//
import './match-item.dart';
import './_helper/match.dart';
import '../_utils/moment.dart';

class MatchList extends StatefulWidget {
  MatchList({Key key, this.league}) : super(key: key);
  final League league;
  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> with AutomaticKeepAliveClientMixin {
  Dio dio = new Dio();
  List matchList;
  var firstTime;
  var lastTime;

  @override
  void initState() {
    _initMatchData();
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;

  _preFormat(List list, int ignoreTime) {
    return list.where((item) {
      return item['dateTime'] != ignoreTime;
    }).toList();
  }

  _fetchData(Map opt) async {
    final url =
        'https://v2.sohu.com/sports-data/football/${widget.league.id}/schedule';
    Response res = await dio.get(url, data: {
      'days': opt['days'],
      'date': opt['date'],
    });

    List dataList = res.data == null ? [] : res.data;
    dataList.sort((m1, m2) {
      return m1['dateTime'].compareTo(m2['dateTime']);
    });
    return dataList;
  }

  _initMatchData() async {
    final String nowDate = new Moment().formatTime();
    var initList = await _fetchData({'days': 4, 'date': nowDate});
    if (!mounted) return;
    setState(() {
      matchList = initList;
      _updateQueryTime();
    });
  }

  _updateQueryTime() {
    var len = matchList == null ? 0 : matchList.length;
    firstTime = matchList[0]['dateTime'];
    if (matchList == null) {
      lastTime = 0;
    } else {
      lastTime = matchList[len - 1]['dateTime'];
    }
  }

  Future _loadForward() async {
    var oldDate = new Moment(timestamp: firstTime).formatTime();
    var preOldList = await _fetchData({'days': -1, 'date': oldDate});
    var oldList = _preFormat(preOldList, firstTime);
    var joinList = new List.from(oldList)..addAll(matchList);
    setState(() {
      matchList = joinList;
      _updateQueryTime();
    });
  }

  _loadAfter() async {
    var newDate = new Moment(timestamp: lastTime).formatTime();
    var preNewList = await _fetchData({'days': 1, 'date': newDate});
    var newList = _preFormat(preNewList, lastTime);
    final int loadNum = newList.length;
    var joinList = new List.from(matchList)..addAll(newList);
    setState(() {
      matchList = joinList;
      _updateQueryTime();
    });
  }

  List _getMatchShowData() {
    List formartList =
        MatchUtil.formatMatchList(matchList, 'football', widget.league);
    return formartList;
  }

  @override
  Widget build(BuildContext context) {
    var formatList = _getMatchShowData();
    if (formatList.length == 0) {
      return BaseLoading();
    } else {
      return JScroll(
          pull: _loadForward,
          child: ListView.builder(
              itemCount: formatList.length,
              itemBuilder: (context, index) {
                return MatchItem(match: formatList[index], league: widget.league);
              }
            )
          );
    }
  }
}
