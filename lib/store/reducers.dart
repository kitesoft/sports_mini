import 'package:sports_mini/store/actions.dart';
import 'package:sports_mini/store/state.dart';

AppState mainReducer(AppState state, dynamic action) {
  if (action is SetCurLeagueAction) {
    state.curLeague = action.league;
  }
  return state;
}