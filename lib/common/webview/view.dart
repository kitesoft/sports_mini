import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  WebView({@required this.url, this.title});
  final String url;
  final String title;
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      url: this.url,
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
    );
  }
}
