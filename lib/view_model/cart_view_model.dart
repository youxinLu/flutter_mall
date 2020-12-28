import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/cart_entity.dart';
import 'package:mall/service/cart_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'dart:convert';

class CartViewModel extends BaseViewModel {
  CartService _cartService = CartService();
  CartEntity _cartEntity;
  bool _isAllCheck = false;
  bool _isShowBottomView = false;

  bool get isShowBottomView => _isShowBottomView;

  CartEntity get cartEntity => _cartEntity;

  bool get isAllCheck => _isAllCheck;

  Future<bool> addCart(int goodsId, int productId, int number) async {
    bool result;
    var parameters = {
      AppParameters.GOODS_ID: goodsId,
      AppParameters.PRODUCT_ID: productId,
      AppParameters.NUMBER: number
    };
    await _cartService.addCart(parameters).then((response) {
      result = response.isSuccess;
      if (!result) {
        ToastUtil.showToast(response.message);
      } else {
        queryCart();
      }
    });
    return result;
  }

  queryCart() {
    _cartService.queryCart().then((response) {
      if (response.isSuccess) {
        _cartEntity = response.data;
        _isAllCheck = _checkedAll();
        pageState = _cartEntity.cartList.length == 0
            ? PageState.empty
            : PageState.hasData;
        _isShowBottomView = _cartEntity.cartList.length > 0;
        notifyListeners();
      } else {
        pageState = PageState.error;
        ToastUtil.showToast(response.message);
      }
    });
  }

  bool _checkedAll() {
    for (int i = 0; i < _cartEntity.cartList.length; i++) {
      if (_cartEntity.cartList[i].checked == null ||
          !_cartEntity.cartList[i].checked) {
        return false;
      }
    }
    return true;
  }

  Future<bool> deleteCartGoods(List productIds, int index) async {
    bool result = false;
    var parameters = {AppParameters.PRODUCT_IDS: productIds};
    await _cartService.deleteCart(parameters).then((response) {
      if (response.isSuccess) {
        queryCart();
        result = true;
      } else {
        ToastUtil.showToast(response.message);
        result = false;
      }
    });
    return result;
  }

  updateCartItem(
      int cartId, int number, int productId, int goodsId, int index) {
    var parameters = {
      AppParameters.PRODUCT_ID: productId,
      AppParameters.GOODS_ID: goodsId,
      AppParameters.NUMBER: number,
      AppParameters.ID: cartId,
    };
    _cartService.updateCart(parameters).then((response) {
      if (response.isSuccess) {
        CartEntity cartEntity = CartEntity.fromJson(_cartEntity.toJson());
        cartEntity.cartList[index].number = number;
        _cartEntity = cartEntity;
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
      }
    });
  }

  checkCartItem(int productId, bool isCheck) {
    var parameters = {
      AppParameters.PRODUCT_IDS: [productId],
      AppParameters.IS_CHECKED: isCheck ? 1 : 0,
    };
    _cartService.cartCheck(parameters).then((response) {
      if (response.isSuccess) {
        _cartEntity = response.data;
        _isAllCheck = _checkedAll();
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
        return false;
      }
    });
  }

  checkAllCartItem(List<int> productId, bool isCheck) {
    var parameters = {
      AppParameters.PRODUCT_IDS: productId,
      AppParameters.IS_CHECKED: isCheck ? 1 : 0,
    };
    _cartService.cartCheck(parameters).then((response) {
      if (response.isSuccess) {
        _cartEntity = response.data;
        _isAllCheck = _checkedAll();
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
        return false;
      }
    });
  }
}
