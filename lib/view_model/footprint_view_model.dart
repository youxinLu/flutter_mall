import 'package:mall/model/foot_print_entity.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/constant/app_parameters.dart';
import 'package:mall/view_model/page_state.dart';

class FootPrintViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  FootPrintEntity _footPrintEntity;
  bool _canLoadMore=false;
  bool _isShowCheckBox = false;
  List<FootPrintGoodsEntity> _goods = List<FootPrintGoodsEntity>();

  FootPrintEntity get footPrintEntity => _footPrintEntity;

  bool get canLoadMore => _canLoadMore;


  List get goods => _goods;

  bool get isShowCheckBox => _isShowCheckBox;

  setShowCheckBox(bool isShow) {
    this._isShowCheckBox = isShow;
    notifyListeners();
  }

  queryFootPrint(int pageIndex, int limit) {
    var parameters = {AppParameters.PAGE: pageIndex, AppParameters.LIMIT: limit};
    _mineService.queryFootPrint(parameters).then((response) {
      if (response.isSuccess) {
        _footPrintEntity = response.data;
        if (pageIndex == 1) {
          _goods.clear();
          _goods = _footPrintEntity.xList;
        } else {
          _goods.addAll(_footPrintEntity.xList);
        }
        _canLoadMore = _goods.length < _footPrintEntity.total;
        pageState = _goods.length == 0 ? PageState.empty : PageState.hasData;
        notifyListeners();
      } else {
        pageState = PageState.error;
        ToastUtil.showToast(response.message);
        notifyListeners();
      }
      notifyListeners();
    });
  }

  setCheck(int index, bool isCheck) {
    _goods[index].isCheck = isCheck;
    notifyListeners();
  }

  Future<bool> deleteFootPrint(List<dynamic> ids) async {
    bool isSuccess = true;
    for (int id in ids) {
      var parameters = {
        AppParameters.ID: id,
      };
      JsonResult result = await _mineService.deleteFootPrint(parameters);
      isSuccess = isSuccess && result.isSuccess;
    }
    return isSuccess;
  }
}
