import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/category_entity.dart';
import 'package:mall/model/category_goods_entity.dart';
import 'package:mall/model/category_title_entity.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/service/http_result_listener.dart';
import 'package:mall/utils/http_util.dart';

class CategoryService {
  //获取一级分类
  Future<JsonResult<CategoryList>> getCategoryData() async {
    JsonResult<CategoryList> jsonResult = JsonResult<CategoryList>();
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(AppUrls.HOME_FIRST_CATEGORY);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        responseList = response[AppStrings.DATA];
        CategoryList categoryList = CategoryList.fromJson(responseList);
        jsonResult.isSuccess = true;
        jsonResult.data = categoryList;
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

  //获取二级分类
  Future<JsonResult<CategoryList>> getSubCategoryData(
      Map<String, dynamic> parameters) async {
    JsonResult<CategoryList> jsonResult = JsonResult<CategoryList>();
    try {
      var responseList = [];
      var response = await HttpUtil.instance
          .get(AppUrls.HOME_SECOND_CATEGORY, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        responseList = response[AppStrings.DATA];
        CategoryList categoryList = CategoryList.fromJson(responseList);
        jsonResult.isSuccess = true;
        jsonResult.data = categoryList;
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

  //获取分类标题
  Future<JsonResult<CategoryTitleEntity>> getCategoryTitle(
      Map<String, dynamic> parameters) async {
    JsonResult<CategoryTitleEntity> jsonResult =
        JsonResult<CategoryTitleEntity>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.CATEGORY_LIST, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        CategoryTitleEntity categoryTitleEntity =
            CategoryTitleEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = categoryTitleEntity;
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
