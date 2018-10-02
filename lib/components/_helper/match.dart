import 'package:sports_mini/common/model/league.dart';
import '../../_utils/moment.dart';

const Map GAME_TYPE = {
  -1: '资格赛',
  1: '小组赛',
  2: '1/8决赛',
  3: '1/4决赛',
  4: '半决赛',
  5: '第三名决赛',
  6: '决赛'
};

const Map GAME_STATUS = {
  '-2': '中止',
  '-1': '延期',
  '0': '取消',
  '1': '未开赛',
  '2': '进行中',
  '3': '已结束',
  '4': '已结束'
};

const String LEAGUE_NAME = '英超';

class MatchUtil {
  static formatMatchList(List list, String type, League league) {
    var moment;
    List formatList = [];
    if (list != null && list.length > 0) {
      formatList = list.map((item) {
        moment = new DateTime.fromMillisecondsSinceEpoch(item['dateTime']);
        item['date'] = moment.month.toString().padLeft(2, '0') +
            '-' +
            moment.day.toString().padLeft(2, '0');
        item['week'] = '星期' + moment.weekday.toString();
        item['games'] = formatGameList(item['games'], false, null, league);
        return item;
      }).toList();
    }
    return formatList;
  }

  static formatGameList(List list, bool isLive, String type, League league) {
    List games;
    String leagueName = league == null ? '' : league.name;
    if (list != null && list.length > 0) {
      games = list.map((game) {
        game['hname'] =
            game['hTeamData'] == null ? '' : game['hTeamData']['teamName'];
        game['hflag'] =
            game['hTeamData'] == null ? '' : game['hTeamData']['flag'];
        game['vname'] =
            game['vTeamData'] == null ? '' : game['vTeamData']['teamName'];
        game['vflag'] =
            game['vTeamData'] == null ? '' : game['vTeamData']['flag'];
        if (game['gameOrder'] > 0) {
          game['title'] = '$leagueName第${game["gameOrder"]}轮';
        } else {
          game['title'] = '$leagueName${GAME_TYPE[game["gameType"]]}';
        }
        if (isLive) {
          game['gameTimeShow'] = new Moment().formatTime(format: 'hh:mm');
        } else {
          game['gameTimeShow'] = new Moment().formatTime(format: 'hh:mm');
        }
        String gameStatus = game['status'].toString();
        if (gameStatus == '1' || gameStatus == '-1') {
          game['progressShow'] = game['gameTimeShow'];
        } else if (gameStatus == '0') {
          game['progressShow'] = '-';
        } else {
          game['progressShow'] = '${game["hTeamScore"]}-${game["vTeamScore"]}';
        }
        game['statusShow'] = GAME_STATUS[gameStatus];
        return game;
      }).toList();
      return games;
    }
  }

  static formatMatchInfo(Map match, League league) {
    if (match != null) {
      match['hname'] =
          match['hTeamData'] == null ? '' : match['hTeamData']['teamName'];
      match['hflag'] =
          match['hTeamData'] == null ? '' : match['hTeamData']['flag'];
      match['vname'] =
          match['vTeamData'] == null ? '' : match['vTeamData']['teamName'];
      match['vflag'] =
          match['vTeamData'] == null ? '' : match['vTeamData']['flag'];
      if (match['gameOrder'] > 0) {
        match['title'] = '${league.name}第${match["gameOrder"]}轮';
      } else {
        match['title'] = '${league.name}${GAME_TYPE[match["gameType"]]}';
      }
      String gameStatus = match['status'].toString();
      if (gameStatus == '1' || gameStatus == '-1') {
        match['progressShow'] = match['gameTimeShow'];
      } else if (gameStatus == '0') {
        match['progressShow'] = '-';
      } else {
        match['progressShow'] =
            '${match["hTeamScore"]}-${match["vTeamScore"]}';
      }
      match['statusShow'] = GAME_STATUS[gameStatus];
      //
      match['target'] = match['hname'] + ',' + match['vname'];
      match['showTitle'] = match['hname'] + 'vs' + match['vname'];
    }

    return match;
  }
}
