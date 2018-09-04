import '../model/league.dart';

class AppState {
  final List<LeagueItem> leagues;
  final ListState listState;
  AppState(this.leagues, this.listState);

  factory AppState.initial() =>
      AppState(List.unmodifiable([]), ListState.listOnly);
}

enum ListState { listOnly }
