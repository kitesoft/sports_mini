import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import '../../common/loading.dart';
import './match-item.dart';
import '../_helper/match.dart';
import '../../_utils/moment.dart';

class MatchList extends StatefulWidget {
  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  RefreshController _refreshController;
  Dio dio = new Dio();
  List matchList;
  var firstTime;
  var lastTime;

  @override
  void initState() {
    _initMatchData();
    _refreshController = new RefreshController();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _initMatchData();
    super.didUpdateWidget(oldWidget);
  }

  _preFormat(List list, int ignoreTime) {
    return list.where((item) {
      return item['dateTime'] != ignoreTime;
    }).toList();
  }

  _fetchData(Map opt) async {
    final url = 'https://v2.sohu.com/sports-data/football/17/schedule';
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

  _loadForward() async {
    var oldDate = new Moment(timestamp: firstTime).formatTime();
    var preOldList = await _fetchData({'days': -1, 'date': oldDate});
    var oldList = _preFormat(preOldList, firstTime);
    var joinList = new List.from(oldList)..addAll(matchList);
    _refreshController.sendBack(true, RefreshStatus.completed);
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
    if (loadNum == 0) {
      _refreshController.sendBack(false, RefreshStatus.noMore);
    } else {
      _refreshController.sendBack(false, RefreshStatus.canRefresh);
    }
    setState(() {
      matchList = joinList;
      _updateQueryTime();
    });
  }

  Widget _headerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(mode: mode);
  }

  Widget _footerCreate(BuildContext context, int mode) {
    return new ClassicIndicator(
      mode: mode,
      refreshingText: 'loading...',
      idleIcon: const Icon(Icons.arrow_upward),
      idleText: 'Loadmore...',
    );
  }

  void _onRefresh(bool up) {
    if (up) {
      _loadForward();
    } else {
      _loadAfter();
    }
  }

  List _getMatchShowData() {
    List formartList = MatchUtil.formatMatchList(matchList, 'football');
    return formartList;
  }

  @override
  Widget build(BuildContext context) {
    var formatList = _getMatchShowData();
    if (formatList.length == 0) {
      return BaseLoading();
    } else {
      return new SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          headerBuilder: _headerCreate,
          footerBuilder: _footerCreate,
          controller: _refreshController,
          child: ListView.builder(
            itemCount: formatList.length,
            itemBuilder: (context, index) {
              return MatchItem(match: formatList[index]);
            },
          ));
    }
  }
}
