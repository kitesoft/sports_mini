import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './store/actions.dart';

class TestPage extends StatelessWidget {
  TestPage({this.title, this.counter});
  final int counter;
  final String title;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<int, VoidCallback>(
        builder: (BuildContext context, VoidCallback callback) {
          return new FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
        converter: (Store<int> store) {
          return () => store.dispatch(Actions.Increse);
        },
      ),
    );
  }
}
