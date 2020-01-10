import 'package:mall/api/api.dart';
import 'package:mall/utils/http_util.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/user_entity.dart';

typedef OnSuccess<T>(T data);

typedef OnFail(String message);

class UserService {
  Future register(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.post(Api.REGISTER, parameters: parameters);
      if (response['errno'] == 0) {
        onSuccess("");
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future login(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.post(Api.LOGIN, parameters: parameters);
      if (response['errno'] == 0) {
        UserEntity userEntity = UserEntity.fromJson(response['data']);
        onSuccess(userEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future loginOut(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.LOGIN_OUT);
      if (response['errno'] == 0) {
        onSuccess(Strings.SUCCESS);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}
