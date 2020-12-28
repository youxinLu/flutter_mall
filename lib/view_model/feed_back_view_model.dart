import 'package:mall/constant/app_parameters.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';

class FeedBackViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  String _feedBackType = AppStrings.PLEASE_SELECT_FEEDBACK_TYPE;

  String get feedBackType => _feedBackType;

  setFeedBackType(String value) {
    _feedBackType = value;
    notifyListeners();
  }

  Future<bool> submitFeedBack(
      String feedBackType, String content, String phoneNumber) async {
    var parameters = {
      AppParameters.CONTENT: content,
      AppParameters.FEED_TYPE: feedBackType,
      AppParameters.HAS_PICTURE: "false",
      AppParameters.MOBILE: phoneNumber,
    };
    bool isSuccess;
    await _mineService.feedback(parameters).then((response) {
      isSuccess = response.isSuccess;
      if (!isSuccess) {
        ToastUtil.showToast(response.message);
      }
    });

    return isSuccess;
  }
}
