import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/app_urls.dart';
import 'package:mall/model/address_detail_entity.dart';
import 'package:mall/model/address_entity.dart';
import 'package:mall/model/collection_entity.dart';
import 'package:mall/model/coupon_entity.dart';
import 'package:mall/model/foot_print_entity.dart';
import 'package:mall/model/json_result.dart';
import 'package:mall/model/order_detail_entity.dart';
import 'package:mall/model/order_list_entity.dart';
import 'package:mall/utils/http_util.dart';

class MineService {
  //收藏或者取消收藏
  Future<JsonResult<dynamic>> addOrDeleteCollect(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance.post(
        AppUrls.COLLECT_ADD_DELETE,
        parameters: parameters,
      );
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
    }
    return jsonResult;
  }

  //查询收藏
  Future<JsonResult<CollectionEntity>> queryCollect(
      Map<String, dynamic> parameters) async {
    JsonResult<CollectionEntity> jsonResult = JsonResult<CollectionEntity>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.MINE_COLLECT, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        CollectionEntity collectEntity =
            CollectionEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = collectEntity;
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

  //获取地址列表
  Future<JsonResult<AddressEntity>> getAddressList() async {
    JsonResult<AddressEntity> jsonResult = JsonResult<AddressEntity>();
    try {
      var response = await HttpUtil.instance.get(
        AppUrls.ADDRESS_LIST,
      );
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        AddressEntity addressEntity =
            AddressEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = addressEntity;
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

  //查询地址详情
  Future<JsonResult<AddressDetailEntity>> queryAddressDetail(
      Map<String, dynamic> parameters) async {
    JsonResult<AddressDetailEntity> jsonResult =
        JsonResult<AddressDetailEntity>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.ADDRESS_DETAIL, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        AddressDetailEntity addressDetailEntity =
            AddressDetailEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = addressDetailEntity;
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

  //删除地址
  Future<JsonResult<dynamic>> deleteAddress(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.ADDRESS_DELETE, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
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

  //添加地址
  Future<JsonResult<dynamic>> addAddress(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance
          .post(AppUrls.ADDRESS_SAVE, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
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

  //我的优惠券
  Future<JsonResult<CouponEntity>> queryCoupon(
      Map<String, dynamic> parameters) async {
    JsonResult<CouponEntity> jsonResult = JsonResult<CouponEntity>();
    try {
      var response = await HttpUtil.instance
          .get(AppUrls.MINE_COUPON_LIST, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        CouponEntity addressDetailEntity =
            CouponEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = addressDetailEntity;
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

  //领取优惠券
  Future<JsonResult<dynamic>> receiveCoupon(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance
          .post(AppUrls.RECEIVE_COUPON, parameters: parameters);
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
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

  //反馈
  Future<JsonResult<dynamic>> feedback(Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance.post(
        AppUrls.FEED_BACK,
        parameters: parameters,
      );
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

  //足迹
  Future<JsonResult<dynamic>> queryFootPrint(
      Map<String, dynamic> parameters) async {
    JsonResult<FootPrintEntity> jsonResult = JsonResult<FootPrintEntity>();
    try {
      var response = await HttpUtil.instance.get(
        AppUrls.MINE_FOOTPRINT,
        parameters: parameters,
      );
      if (response[AppStrings.ERR_NO] == 0) {
        FootPrintEntity footPrintEntity =
            FootPrintEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = footPrintEntity;
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

  //删除足迹
  Future<JsonResult<dynamic>> deleteFootPrint(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance.post(
        AppUrls.MINE_FOOTPRINT_DELETE,
        parameters: parameters,
      );
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

  //查询订单
  Future<JsonResult<OrderListEntity>> queryOrder(
      Map<String, dynamic> parameters) async {
    JsonResult<OrderListEntity> jsonResult = JsonResult<OrderListEntity>();
    try {
      var response = await HttpUtil.instance.get(
        AppUrls.MINE_ORDERS,
        parameters: parameters,
      );
      if (response[AppStrings.ERR_NO] == 0) {
        jsonResult.isSuccess = true;
        OrderListEntity orderListEntity =
            OrderListEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.data = orderListEntity;
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

  //删除订单
  Future<JsonResult<dynamic>> deleteOrder(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance.post(
        AppUrls.MINE_ORDER_DELETE,
        parameters: parameters,
      );
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

  //取消订单
  Future<JsonResult<dynamic>> cancelOrder(
      Map<String, dynamic> parameters) async {
    JsonResult<dynamic> jsonResult = JsonResult<dynamic>();
    try {
      var response = await HttpUtil.instance.post(
        AppUrls.MINE_ORDER_CANCEL,
        parameters: parameters,
      );
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

//查询订单详情
  Future<JsonResult<OrderDetailEntity>> queryOrderDetail(
      Map<String, dynamic> parameters) async {
    JsonResult<OrderDetailEntity> jsonResult = JsonResult<OrderDetailEntity>();
    try {
      var response = await HttpUtil.instance.get(
        AppUrls.MINE_ORDER_DETAIL,
        parameters: parameters,
      );
      if (response[AppStrings.ERR_NO] == 0 &&
          response[AppStrings.DATA] != null) {
        OrderDetailEntity orderDetailEntity =
            OrderDetailEntity.fromJson(response[AppStrings.DATA]);
        jsonResult.isSuccess = true;
        jsonResult.data = orderDetailEntity;
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
