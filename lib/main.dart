import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
//
import 'package:sports_mini/store/reducers.dart';
import 'package:sports_mini/store/state.dart';
//
import 'package:sports_mini/components/home/page.dart';

void main() {
  Store<AppState> store =
      new Store<AppState>(mainReducer, initialState: AppState.initial());
  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
            title: '体育+',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: new StoreConnector<AppState, AppState>(
              builder: (BuildContext context, AppState state) {
                return new HomePage(
                    title: '搜狐体育', league: state.curLeague);
              },
              converter: (Store<AppState> store) {
                return store.state;
              },
            )));
  }
}
