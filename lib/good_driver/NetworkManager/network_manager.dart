import 'package:hxh_flutter_kit/hxh_flutter_kit/http_util/hxh_http_utils.dart';

///模型类
import 'commonModels/sdg_cooperator_model.dart';

///所有合作单位
class SDGDataManager {
  getCooperation(Map param,
      Function(int state, bool isSuccess, dynamic resp) complete) async {
    //                http://192.168.0.24:8769/admin/v2.0/work/driverList?limit=123&page=1&username=1
//    String path = 'http://192.168.0.24:8769/admin/v2'
//        '.0/work/driverList';
    String path = BaseUrl.HOST_static + '/admin/v2.0/work/list';
    HXHHttpUtils().getRequest(path, param, (state, isSuccess, resp) {
      if (isSuccess) {
        List list = resp['records'];
        List<SDGCooperatorModel> modelList = List();
        for (var i = 0; i < list.length; ++i) {
          var o = list[i];
          SDGCooperatorModel model = SDGCooperatorModel.fromJson(o);
          print('model : ' + model.customerName);
          modelList.add(model);
        }
        complete(state, isSuccess, modelList);
      } else {
        complete(state, isSuccess, resp);
      }
    });
  }
}
