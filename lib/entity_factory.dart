import 'package:HXHFlutterKit/good_driver/NetworkManager/commonModels/asdasdasdasd_entity.dart';
import 'package:HXHFlutterKit/good_driver/NetworkManager/commonModels/sdg_cooperator_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AsdasdasdasdEntity") {
      return AsdasdasdasdEntity.fromJson(json) as T;
    } else if (T.toString() == "SDGCooperatorModelEntity") {
      return SDGCooperatorModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}