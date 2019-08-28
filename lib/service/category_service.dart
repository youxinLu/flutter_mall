import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/first_level_category.dart';
import 'package:mall/entity/sub_category_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/category_title_entity.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnFail(String message);

typedef OnSuccess<T>(T data);

class CategoryService {
  Future getCategoryData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.HOME_FIRST_CATEGORY);
      if (response['errno'] == 0) {
        responseList = response['data'];
        FirstLevelListCategory firstLevelListCategory =
            FirstLevelListCategory.fromJson(responseList);
        onSuccessList(firstLevelListCategory.firstLevelCategory);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getSubCategoryData(
      Map<String, dynamic> parameters, OnSuccessList onSuccessList,
      {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance
          .get(Api.HOME_SECOND_CATEGORY, parameters: parameters);
      if (response['errno'] == 0) {
        responseList = response['data'];
        SubCategoryListEntity subCategoryListEntity =
            SubCategoryListEntity.fromJson(responseList);
        onSuccessList(subCategoryListEntity.subCategoryEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getCategoryTitle(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.CATEGORY_LIST, parameters: parameters);
      if (response['errno'] == 0) {
        CategoryTitleEntity categoryTitleEntity =
            CategoryTitleEntity.fromJson(response["data"]);
        onSuccess(categoryTitleEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}
