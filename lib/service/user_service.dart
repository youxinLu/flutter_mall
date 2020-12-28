import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/model/user_entity.dart';
import 'package:mall/utils/http_util.dart';

class UserService {

  Future<JsonResult<UserEntity>> login(Map<String, dynamic> parameters) async {
    JsonResult<UserEntity> jsonResult = JsonResult<UserEntity>();
    try {
      var response = await HttpUtil.instance.post(
          AppUrls.LOGIN, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        UserEntity userEntity = UserEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = userEntity;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
    }
    return jsonResult;
  }


Future<JsonResult<dynamic>> register(Map<String, dynamic> parameters) async {
  JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
  try {
    var response = await HttpUtil.instance.post(AppUrls.REGISTER, parameters: parameters);
    if (response[AppStrings.ERR_NO] == 0) {
      jsonResult.isSuccess = true;
      jsonResult.data = AppStrings.SUCCESS;
    } else {
      jsonResult.isSuccess = false;
      jsonResult.message = response[AppStrings.ERR_MSG] != null
          ? response[AppStrings.ERR_MSG]
          : AppStrings.SERVER_EXCEPTION;
    }
  } catch (e) {
    jsonResult.isSuccess = false;
    jsonResult.message = AppStrings.SERVER_EXCEPTION;
  }
  return jsonResult;
}


}
