import 'package:sports_mini/model/league.dart';
import './data/leagues.dart';

final League initLeague = League.fromJson(leagueList['17']);

class AppState {
  League curLeague;
  AppState({this.curLeague});

  static initial() {
    return new AppState(curLeague: initLeague);
  }
}
