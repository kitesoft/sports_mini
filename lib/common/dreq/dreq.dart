// 参照 vreq的功能实现，TBD
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// class DRequest extends StatefulWidget {

// }

class DRequest extends StatefulWidget {
  DRequest({this.child});
  final Widget child;
  @override
  _DRequestState createState() => _DRequestState();
}

class _DRequestState extends State<DRequest> {
  Dio dio;
  @override
  void initState() {
    dio = new Dio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
