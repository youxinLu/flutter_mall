import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/collection_entity.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class CollectViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  bool _canLoadMore = false;
  List<CollectionList> data=List();

  bool get canLoadMore => _canLoadMore;

  queryData(int pageIndex, int limit) {
    var parameters = {
      AppParameters.TYPE: 0,
      AppParameters.PAGE: pageIndex,
      AppParameters.LIMIT: limit
    };
    _mineService.queryCollect(parameters).then((response) {
      if (response.isSuccess) {
        if (pageIndex == 1) {
          data.clear();
          data = response.data.xList;
        } else {
          data.addAll(response.data.xList);
        }
        pageState = data.length == 0 ? PageState.empty : PageState.hasData;
        _canLoadMore = response.data.total > data.length;
        notifyListeners();
      } else {
        pageState = PageState.error;
        ToastUtil.showToast(response.message);
        notifyListeners();
      }
    });
  }

  Future addOrDeleteCollect(int index) {
    var parameters = {
      AppParameters.TYPE: 0,
      AppParameters.VALUE_ID: data[index].valueId
    };
    return _mineService.addOrDeleteCollect(parameters).then((response) {
      if (response.isSuccess) {
        data.removeAt(index);
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
      }
    });
  }
}
