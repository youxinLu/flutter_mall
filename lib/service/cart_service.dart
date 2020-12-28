import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/cart_entity.dart';
import 'package:mall/model/fill_in_order_entity.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/utils/http_util.dart';

class CartService {
  Future<JsonResult<dynamic>> addCart(Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance
          .post(AppUrls.ADD_CART, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0) {
        jsonResult.isSuccess = true;
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

  Future<JsonResult<FillInOrderEntity>> cartCheckOut(
      Map<String, dynamic> parameters) async {
    JsonResult<FillInOrderEntity> jsonResult = JsonResult<FillInOrderEntity>();
    try {
      var response =
          await HttpUtil.instance.get(AppUrls.CART_BUY, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        FillInOrderEntity fillInOrderEntity =
            FillInOrderEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = fillInOrderEntity;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
      print(e.toString());
    }
    return jsonResult;
  }

  Future<JsonResult<CartEntity>> queryCart() async {
    JsonResult<CartEntity> jsonResult = JsonResult<CartEntity>();
    try {
      var response;
      response = await HttpUtil.instance.get(AppUrls.CART_LIST);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        jsonResult.isSuccess = true;
        CartEntity cartEntity = CartEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.data = cartEntity;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
      print(e.toString());
    }
    return jsonResult;
  }

  Future<JsonResult<CartEntity>> cartCheck(Map<String, dynamic> parameters) async {
    JsonResult<CartEntity> jsonResult = JsonResult<CartEntity>();
    try {
      var response = await HttpUtil.instance
          .post(AppUrls.CART_CHECK, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        jsonResult.isSuccess = true;
        CartEntity cartEntity = CartEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.data = cartEntity;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
      print(e.toString());
    }
    return jsonResult;
  }

  Future<JsonResult<CartEntity>> deleteCart(Map<String, dynamic> parameters) async {
    JsonResult<CartEntity> jsonResult = JsonResult<CartEntity>();
    try {
      var response;
      response = await HttpUtil.instance
          .post(AppUrls.CART_DELETE, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        jsonResult.isSuccess = true;
        CartEntity cartEntity = CartEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.data = cartEntity;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
      print(e.toString());
    }
    return jsonResult;
  }

  Future<JsonResult<dynamic>> updateCart(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response;
      response = await HttpUtil.instance
          .post(AppUrls.CART_UPDATE, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 ) {
        jsonResult.isSuccess = true;
      } else {
        jsonResult.isSuccess = false;
        jsonResult.message = response[AppStrings.ERR_MSG] != null
            ? response[AppStrings.ERR_MSG]
            : AppStrings.SERVER_EXCEPTION;
      }
    } catch (e) {
      jsonResult.isSuccess = false;
      jsonResult.message = AppStrings.SERVER_EXCEPTION;
      print(e.toString());
    }
    return jsonResult;
  }
}
