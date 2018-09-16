import 'package:sports_mini/model/league.dart';

enum Actions { SetCurLeague, SetMatchInfo, SetTeamInfo }

class Action {
  final Actions type;
  Action({this.type});
}

class SetCurLeagueAction extends Action {
  final League league;

  SetCurLeagueAction({this.league}) : super(type: Actions.SetCurLeague);
}
