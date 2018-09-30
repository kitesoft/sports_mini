import '../webview/view.dart';

class LinkHandler {
  static to(String str) {
    RegExp webExp = new RegExp("(web-).*?");
    RegExp nativeExp = new RegExp("(native-).*?");
    if (str == '') return null;
    //
    if (nativeExp.hasMatch(str) == true) {
      return null;
    } else if (webExp.hasMatch(str) == true) {
      return new WebView(url: str, title: '');
    } else {
      //默认页面
      return null;
    }
  }
}
