import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/brand_detail_entity.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/utils/http_util.dart';

/**
 * Create by luyouxin
 * description
    Created by $USER_NAME on 2020/9/16.
 */

class BrandDetailService{

  Future<JsonResult<BrandDetailEntity>> queryBrandDetail(Map<String, dynamic> parameters) async {
    JsonResult<BrandDetailEntity> jsonResult=new JsonResult<BrandDetailEntity>();
    try {
      var response =
      await HttpUtil.instance.get(AppUrls.BRAND_DETAIL, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        BrandDetailEntity brandDetailEntity =
        BrandDetailEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = brandDetailEntity;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
      print(e.toString());
    }
    return jsonResult;
  }
}