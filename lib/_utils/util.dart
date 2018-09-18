class Util {
  static fixUrl(String url) {
    final RegExp hasProtocal = new RegExp('http');
    if (hasProtocal.hasMatch(url)) {
      return url;
    } else {
      return 'https:' + url;
    }
    
  }
}
