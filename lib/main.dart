import 'package:flutter/material.dart';
import './pages/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of sports-app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '体育+',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: '体育+'),
    );
  }
}

