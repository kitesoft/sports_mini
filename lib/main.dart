import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

//
import './store/reducers.dart';
import './store/state.dart';
import './store/middleware.dart';
//
import './components/home/page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(new SportsReduxApp());
}

class SportsReduxApp extends StatelessWidget {
  //
  // store
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
      store: this.store,
      child: MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      ));
}
