import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';

//
import './store/state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel> (
    converter: (Store<AppState> store) => _ViewModel.create(store),
    builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
      app
    ),
  );
}
