import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/fill_in_order_entity.dart';
import 'package:mall/service/cart_service.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'dart:convert';

class FillInOrderViewModel extends BaseViewModel {
  CartService _cartService = CartService();
  GoodsService _goodsService = GoodsService();

  FillInOrderEntity _fillInOrderEntity;

  FillInOrderCheckedaddress _fillInOrderCheckAddress;

  FillInOrderEntity get fillInOrderEntity => _fillInOrderEntity;

  FillInOrderCheckedaddress get fillInOrderCheckAddress =>
      _fillInOrderCheckAddress;

  queryFillInOrderData(int cardId) {
    var parameters = {
      AppParameters.CART_ID: cardId,
      AppParameters.ADDRESS_ID: 0,
      AppParameters.COUPON_ID: 0,
      AppParameters.GROUPON_RULES_ID: 0,
    };
    _cartService.cartCheckOut(parameters).then((response) {
      if (response.isSuccess) {
        _fillInOrderEntity = response.data;
        _fillInOrderCheckAddress = _fillInOrderEntity.checkedAddress;
        pageState =
            _fillInOrderEntity == null ? PageState.empty : PageState.hasData;
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
      }
    });
  }

  updateAddress(var address) {
    print((jsonDecode(Uri.decodeComponent(address))));
    _fillInOrderCheckAddress = FillInOrderCheckedaddress.fromJson(
        (jsonDecode(Uri.decodeComponent(address))));
    notifyListeners();
  }

  Future<bool> submitOrder(
      int cartId, int addressId, String message, int couponId) async {
    bool isResult = false;
    var parameters = {
      AppParameters.CART_ID: cartId,
      AppParameters.ADDRESS_ID: addressId,
      AppParameters.MESSAGE: message,
      AppParameters.COUPON_ID: couponId,
      AppParameters.GROUPON_RULES_ID: 0,
      AppParameters.GROUPON_LINK_ID: 0
    };
    await _goodsService.submitOrder(parameters).then((response) {
      isResult = response.isSuccess;
      if (!response.isSuccess) {
        ToastUtil.showToast(response.message);
      }
    });
    return isResult;
  }
}
