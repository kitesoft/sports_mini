import 'package:dio/dio.dart';

class RequestStatus {
  static const int init = 0; // 初始化
  static const int failed = -1; // 失败
  static const int success = 1; // 正常
  static const int noData = 2; // 无数据
}

class Request {
  int status = RequestStatus.init;
  //
  Dio dioInstance;
  Request({String type, String baseURL}) {
    String baseUrl;
    if (baseURL != null) {
      baseUrl = baseURL;
    } else if (type == 'recommend') {
      baseUrl = 'https://v2.sohu.com/integration-api/';
    } else {
      baseUrl = 'https://v2.sohu.com/sports-data/';
    }
    Options options = new Options(
        baseUrl: baseUrl, connectTimeout: 5000, receiveTimeout: 3000);
    dioInstance = new Dio(options);
  }

  static checkDataEmpty(Response res) {
    int _status = 2;
    if (res.data != null) {
      _status = 1;
    }
    return _status;
  }

  fetch(String url, Map params) async {
    try {
      Response res = await dioInstance.get(url, data: params);
      print(res.runtimeType);
      this.status = checkDataEmpty(res);
      return res;
    } catch (e) {
      this.status = RequestStatus.failed;
    }
  }
}
