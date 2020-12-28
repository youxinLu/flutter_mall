import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/order_list_entity.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

/**
 * Create by luyouxin
 * description
    Created by $USER_NAME on 2020/10/30.
 */

class OrderViewModel extends BaseViewModel {
  bool _canLoadMore = false;
  List<OrderEntity> _data = List();
  MineService _mineService = MineService();

  bool get canLoadMore => _canLoadMore;

  List<OrderEntity> get data => _data;

  queryOrder(int orderType, int pageIndex, int pageSize) {
    var parameters = {
      AppParameters.SHOW_TYPE: orderType,
      AppParameters.PAGE: pageIndex,
      AppParameters.LIMIT: pageSize
    };

    _mineService.queryOrder(parameters).then((response) {
      if (response.isSuccess) {
        OrderListEntity orderListEntity = response.data;
        if (pageIndex == 1) {
          _data.clear();
          _data = orderListEntity.xList;
        } else {
          _data.addAll(orderListEntity.xList);
        }
        print(_data.length);
        _canLoadMore = orderListEntity.total > _data.length;
        pageState = _data.length == 0 ? PageState.empty : PageState.hasData;
        notifyListeners();
      } else {
        pageState = PageState.error;
        ToastUtil.showToast(response.message);
        notifyListeners();
      }
    });
  }

  Future<bool> deleteOrder(int orderId) async {
    bool result;
    var parameters = {AppParameters.ORDER_ID: orderId};
    await _mineService.deleteOrder(parameters).then((response) {
      result = response.isSuccess;
      if (!result) {
        ToastUtil.showToast(response.message);
      }
    });
    return result;
  }

  Future<bool> cancelOrder(int orderId) async {
    bool result;
    var parameters = {AppParameters.ORDER_ID: orderId};
    await _mineService.cancelOrder(parameters).then((response) {
      result = response.isSuccess;
      if (!result) {
        ToastUtil.showToast(response.message);
      }
    });
    return result;
  }
}
