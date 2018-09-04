import 'package:redux/redux.dart';
import '../model/league.dart';
import './actions.dart';
import './state.dart';

AppState appReducer(AppState state, action) => AppState();

final Reducer<List<LeagueItem>> leaguesReducer = combineReducers(
    [TypedReducer<List<LeagueItem>, AddLeagueAction>(_addItem)]);

List<LeagueItem> _addItem(List leagues, AddLeagueAction action) =>
    List.unmodifiable(List.from(leagues)..add(action.leagueItem));
