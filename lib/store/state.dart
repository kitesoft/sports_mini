import '../model/league.dart';
import './data/leagues.dart';

final League initLeague = leagueList['17'];

class AppState {
  League league;
  AppState({this.league});
  

  factory AppState.initial() => AppState(league: initLeague);
}
