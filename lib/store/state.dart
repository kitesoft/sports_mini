import 'package:sports_mini/model/league.dart';

final League initLeague = new League(id: '17', name: '英超');

class AppState {
  League curLeague;
  AppState({this.curLeague});

  static initial() {
    return new AppState(curLeague: initLeague);
  }
}
