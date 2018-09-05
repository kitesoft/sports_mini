import 'package:flutter/material.dart';
// import './components/home/page.dart';
import './test.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
//
import './store/actions.dart';
import './store/reducers.dart';

void main() {
  Store<int> store = new Store<int>(mainReducer, initialState: 0);
  runApp(new MyApp(store: store));
}

int mainReducer(int state, dynamic action) {
  if (Actions.Increse == action) {
    return state + 1;
  }
  return state;
}

class MyApp extends StatelessWidget {
  final Store<int> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
            title: '体育+',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: new StoreConnector(
              builder: (BuildContext context, int counter) {
                return new TestPage(
                    title: 'FLutter Demo Home Page', counter: counter);
              },
              converter: (Store<int> store) {
                return store.state;
              },
            )));
  }
}
