import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import './GSYState.dart';
import './user.dart';

void main() {
  runApp(new FlutterReduxApp());
}

class FlutterReduxApp extends StatelessWidget {
  final store = new Store<GSYState>(
    appReducer,
    initialState: new GSYState(
      userInfo: User.empty(),
      themeData: new ThemeData(
        primarySwatch: GSYColors.primarySwatch
      )
    )
  );




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
