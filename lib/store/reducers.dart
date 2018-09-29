import './actions.dart';
import './state.dart';

AppState mainReducer(AppState state, dynamic action) {
  if (action is SetCurLeagueAction) {
    state.curLeague = action.league;
  }
  return state;
}