class FormatUtil {
  static formatContent(String content) {
    if (content == null) {
      return '';
    } else {
      return content.replaceAll(new RegExp('src=\"//'), 'src=\"https://');
    }
  }
}
