import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

enum Actions {
  Increase,
}

int mainReducer(int state, dynamic action) {
  if (Actions.Increase == action) {
    return state + 1;
  }

  return state;
}

void main() {
  Store<int> store = new Store(mainReducer, initialState: 0);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final Store<int> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(primarySwatch: Colors.blue),
          home: new StoreConnector(
            builder: (BuildContext context, int counter) {
              return new MyHomePage(
                  title: 'Flutter Demo Home Page', counter: counter);
            },
            converter: (Store<int> store) {
              return store.state;
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.counter}) : super(key: key);
  final String title;
  final int counter;

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
            new FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            );
          },
          converter: (Store<int> store) {
            return () => store.dispatch(Actions.Increase);
          },
        ));
  }
}
