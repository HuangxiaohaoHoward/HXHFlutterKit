import 'package:dio/dio.dart';

class HXHHttpUtils {
  /*基础设置*/
  Dio dio;
  BaseOptions options;

  /*get*/

  getRequest(String path, ) async {
    try {
      Response response = await Dio().get(path);
      print(response.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
