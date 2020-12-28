import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/model/project_selection_detail_entity.dart';
import 'package:mall/model/related_project_selection_entity.dart';
import 'package:mall/utils/http_util.dart';

class ProjectSelectionService {
  Future<JsonResult<ProjectSelectionDetailEntity>> projectSelectionDetail(
      Map<String, dynamic> parameters) async {
    JsonResult<ProjectSelectionDetailEntity> jsonResult =
        JsonResult<ProjectSelectionDetailEntity>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.PROJECT_SELECTION_DETAIL, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        ProjectSelectionDetailEntity projectSelectionDetailEntity =
            ProjectSelectionDetailEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = projectSelectionDetailEntity;
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

  Future<JsonResult<RelatedProjectSelectionEntity>> projectSelectionRecommend(
      Map<String, dynamic> parameters) async {
    JsonResult<RelatedProjectSelectionEntity> jsonResult =
        JsonResult<RelatedProjectSelectionEntity>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.PROJECT_SELECTION_RECOMMEND, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        RelatedProjectSelectionEntity relatedProjectSelectionEntity =
            RelatedProjectSelectionEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = relatedProjectSelectionEntity;
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
