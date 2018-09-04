import 'dart:async';
import 'package:redux/redux.dart';
import './state.dart';
import './actions.dart';

List<Middleware<AppState>> createStoreMiddleware() => [
      TypedMiddleware(_saveList),
    ];
Future _saveList(
    Store<AppState> store, AddLeagueAction action, NextDispatcher next) async {
  await Future.sync(() => Duration(seconds: 3));
  next(action);
}
