const GAME_TYPE = {
  '-1': '资格赛',
  1: '小组赛',
  2: '1/8决赛',
  3: '1/4决赛',
  4: '半决赛',
  5: '第三名决赛',
  6: '决赛'
};

const GAME_STATUS = {
  '-2': '中止',
  '-1': '延期',
  0: '取消',
  1: '未开赛',
  2: '进行中',
  3: '已结束',
  4: '已结束'
};

class MatchUtil {
  static formatMatchList(List list, String type) {
    var moment;
    return list.map((item) {
      moment = new DateTime.fromMillisecondsSinceEpoch(item['dateTime']);
      item['date'] = moment.month.toString().padLeft(2,'0') + '-' + moment.day.toString().padLeft(2, '0');
      item['week'] = '星期' + moment.weekday.toString();
      return item;
    }).toList();
  }

  static formatGameList() {}
}
