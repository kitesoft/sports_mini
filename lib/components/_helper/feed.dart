import '../../_utils/moment.dart';
class FeedUtil {
  static List formatFeedList(List feedList) {
    List formatList = [];
    var showTime, picUrl;
    if (feedList != null) {
      formatList = feedList.map((item) {
        showTime = item['publishTime'] == null ? item['publicTime'] :  item['publishTime'];
        item['showTime'] = new Moment(timestamp: showTime).formatTime(format: 'MM-dd');
        item['link'] = item['url'];
        picUrl = item['picUrl'] == null ? item['cover'] : item['picUrl'];
        item['picUrl'] = 'https:' + picUrl;
        return item;
      }).toList();
    }
    return formatList;
  }
}