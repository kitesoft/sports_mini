import 'package:sports_mini/common/model/league.dart';
import './data/leagues.dart';

final League _init = League.fromJson(leagueList['17']);

class AppState {
  League curLeague;
  AppState({this.curLeague});

  static initial() {
    return new AppState(curLeague: _init);
  }
}
