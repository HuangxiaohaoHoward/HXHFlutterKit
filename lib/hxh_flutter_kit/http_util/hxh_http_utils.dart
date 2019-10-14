import 'package:dio/dio.dart';

class HXHHttpUtils {
  /*基础设置*/
  Dio dio;
  BaseOptions options;

  /*get*/

  getRequest(String path, Map param, Function(int state, bool isSuccess, dynamic resp) completion) async {
    try {
      Response response = await Dio().get(path);
      print(response.toString());
      if (response.statusCode == 200)
        switch(response.statusCode){
          case 200:
            completion(response.statusCode, true, response.data);
            break;

          default:
            completion(response.statusCode, false, response.data);
            break;
        }
    } catch (e) {
      print(e.toString());
    }
  }
}
