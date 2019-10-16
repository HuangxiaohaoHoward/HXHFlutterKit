import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class BaseUrl {
  //静态环境 - 测试
  static const String HOST_static = "http://test.xzhaosiji.com:92";
  static const String HOST_Img_static = "http://test.xzhaosiji.com:96/images";
  static const String HOST_H5_static = "http://test.xzhaosiji.com:96/driver-h5";
}

class HXHHttpUtils {
  /*基础设置*/
  Dio dio;
  BaseOptions options;

  ///get
  getRequest(String path, Map param,
      Function(int state, bool isSuccess, dynamic resp) completion) async {
    _sendRequest(RequestType.get, path, param, completion);
  }

  ///post
  postRequest(String path, Map param,
      Function(int state, bool isSuccess, dynamic resp) completion) async {
    _sendRequest(RequestType.post, path, param, completion);
  }

  ///基础请求
  _sendRequest(RequestType type, String path, Map param,
      Function(int state, bool isSuccess, dynamic resp) completion) async {
    try {
      Response response;
      switch (type) {
        case RequestType.get:
          {
            response = await Dio()
                .get(path, queryParameters: Map<String, dynamic>.from(param));
            break;
          }
        case RequestType.post:
          {
            response = await Dio()
                .post(path, queryParameters: Map<String, dynamic>.from(param));
            break;
          }
        case RequestType.put:
          {
            break;
          }
        case RequestType.delete:
          {
            break;
          }
      }

      if (response.statusCode == 200)
        switch (response.statusCode) {
          case 200:
            completion(response.statusCode, true, response.data);
            break;

          default:
            completion(response.statusCode, false, response.data);
            break;
        }
    } catch (e) {
      if (e.response != null) {
        Response errorResp = e.response;
        switch (errorResp.statusCode) {
          case 401:

            /// FIXME: 此处要做登录失效的处理

            break;
          default:
            break;
        }
        print(
            'statusCode : ${errorResp.statusCode}\nstatusMessage : ${errorResp.statusMessage}'
            '\nerrorResp.data.message : ${errorResp.data['message']}');
        completion(
          errorResp.statusCode,
          false,
          errorResp.data['message'] ?? 'error',
        );
      } else {
        print('error type : ${e.type}\nerror : ${e.error.message}');
        completion(
          e.type.index ?? 0,
          false,
          e.error.message ?? '-',
        );
      }
    }
  }
}
