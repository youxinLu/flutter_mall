import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/utils/http_util.dart';

class HomeService {
  Future<JsonResult<HomeEntity>> queryHomeData() async {
    JsonResult<HomeEntity> jsonResult = JsonResult<HomeEntity>();
    try {
      var response = await HttpUtil.instance.get(AppUrls.HOME_URL);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        HomeEntity homeEntity = HomeEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = homeEntity;
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
