import 'package:flutter/material.dart';
import './components/home/page.dart';
import './components/webview/view.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of sports-app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '体育+',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: '体育+'),
      routes: {
        "/webview": (ctx){
          print(ctx);
        }
      },
      
    );
  }
}

