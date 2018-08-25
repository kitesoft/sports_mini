import 'package:intl/intl.dart';
import 'dart:math';

class Moment {
  int time;
  DateTime date;
  Moment(dynamic timestamp) {
    this.time = timestamp;
    this.date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  String formatTime({String format: 'yyyy-MM-dd'}) {
    var formatter = new DateFormat(format);
    return formatter.format(this.date);
  }

  String getWeek() {
    int weekday = this.date.weekday;
    String week;
    switch (weekday) {
      case 1:
        week = '星期一';
        break;
      case 2:
        week = '星期二';
        break;
      case 3:
        week = '星期三';
        break;
      case 4:
        week = '星期四';
        break;
      case 5:
        week = '星期五';
        break;
      case 6:
        week = '星期六';
        break;
      case 7:
        week = '星期日';
        break;
      default:
        week = '';
    }
    return week;
  }

  String fixTime() {
    return '';
  }

  String formatShowTime() {
    return '';
  }

  String diffNow() {
    return '';
  }

  void getDiff({int delta: 0, bool format: false}) {
    var diff = ;
  }
}
