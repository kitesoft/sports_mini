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

const String BASE_URL = '/z/';
const String LEAGUE_NAME = '英超';

class MatchUtil {
  static formatMatchList(List list, String type) {
    var moment;
    List formatList = [];
    if (list != null && list.length > 0) {
      formatList = list.map((item) {
        moment = new DateTime.fromMillisecondsSinceEpoch(item['dateTime']);
        item['date'] = moment.month.toString().padLeft(2,'0') + '-' + moment.day.toString().padLeft(2, '0');
        item['week'] = '星期' + moment.weekday.toString();
        return item;
      }).toList();
    }
    return formatList;
  }

  static formatGameList(List list, bool isLive, String type) {
    List games;
    if (list != null && list.length > 0) {
      games = list.map((game){
        // game['link'] = BASE_URL + '/match' + game['gameCode'];
        game['hname'] = game['hTeamData'] == null ? '' : game['hTeamData']['teamName'];
        game['hflag'] = game['hTeamData'] == null ? '' : game['hTeamData']['flag'];
        game['vname'] = game['vTeamData'] == null ? '' : game['vTeamData']['teamName'];
        game['vflag'] = game['vTeamData'] == null ? '' : game['vTeamData']['flag'];
        if (game['gameOrder'] > 0) {
          game['title'] = '${LEAGUE_NAME}第${game["gameOrder"]}轮';
        } else {
          game['title'] = '${LEAGUE_NAME}${GAME_TYPE[game["gameType"]]}';
        }
        if (isLive) {
          game['gameTimeShow'] ='gameTimeShow';
        } else {
          game['gameTimeShow'] ='gameTimeShow';
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
}
