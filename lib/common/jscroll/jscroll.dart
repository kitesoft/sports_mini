import 'package:flutter/material.dart';

class JScroll extends StatefulWidget {
  JScroll({Key key, this.pull, this.child}) : super(key: key);
  final Function pull;
  final Widget child;
  @override
  _JScrollState createState() => _JScrollState();
}

class _JScrollState extends State<JScroll> {
  // 提示下拉刷新成功
  _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 800),
        backgroundColor: Colors.blue,
        content: const Text('刷新完成.', textAlign: TextAlign.center,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: widget.child,
      onRefresh: () async {
        await widget.pull();
        _showToast(context);
      },
    );
  }
}
