import 'package:flutter/material.dart';

class JScroll extends StatefulWidget {
  JScroll({Key key, this.pull, this.child}) : super(key: key);
  final Function pull;
  final Widget child;
  @override
  _JScrollState createState() => _JScrollState();
}

class _JScrollState extends State<JScroll> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: widget.child,
      onRefresh: widget.pull,
    );
  }
}
