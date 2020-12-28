import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/order_detail_entity.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

/**
 * Create by luyouxin
 * description
    Created by $USER_NAME on 2020/10/31.
 */

class OrderDetailViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  OrderDetailEntity _orderDetailEntity;

  OrderDetailEntity get orderDetailEntity => _orderDetailEntity;

  queryOrderDetail(int orderId) {
    var parameters = {AppParameters.ORDER_ID: orderId};
    _mineService.queryOrderDetail(parameters).then((response) {
      if (response.isSuccess) {
        _orderDetailEntity = response.data;
        pageState =
            _orderDetailEntity == null ? PageState.empty : PageState.hasData;
        notifyListeners();
      } else {
        pageState = PageState.error;
        ToastUtil.showToast(response.message);
        notifyListeners();
      }
    });
  }

}
