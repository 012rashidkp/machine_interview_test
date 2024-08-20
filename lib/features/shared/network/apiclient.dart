
import 'package:dio/dio.dart';

const String base_url = 'https://mock-api.zoft.care/';

BaseOptions apiclient = BaseOptions(
    baseUrl: base_url,
    responseType: ResponseType.json,
    // contentType: 'application/json',
    connectTimeout: Duration(milliseconds: 7500),
    receiveTimeout: Duration(milliseconds: 7500),
    // ignore: missing_return
    validateStatus: (code) {
      if (code! >= 200) {
        return true;
      } else
        return false;
    });