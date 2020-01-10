import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:dio/dio.dart';
import 'package:mall/entity/coupon_list_entity.dart';
import 'package:mall/entity/footprint_entity.dart';
import 'package:mall/entity/collect_entity.dart';
import 'package:mall/entity/order_entity.dart';
import 'package:mall/entity/order_detail_entity.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnSuccess<T>(T banners);

typedef OnFail(String message);

class MineService {
  Future feedback(Map<String, dynamic> parameters,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .post(Api.FEED_BACK, parameters: parameters, );
      if (response['errno'] == 0) {
        onSuccess(Strings.SUCCESS);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future couponList(Map<String, dynamic> parameters,
      OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_COUPON_LIST, parameters: parameters, );
      if (response['errno'] == 0) {
        CouponListEntity couponListEntity =
            CouponListEntity.fromJson(response["data"]);
        onSuccessList(couponListEntity.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future footPrint(Map<String, dynamic> parameters,
      OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_FOOTPRINT, parameters: parameters,);
      if (response['errno'] == 0) {
        FootprintEntity footprintEntity =
            FootprintEntity.fromJson(response["data"]);
        onSuccessList(footprintEntity.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future deleteFootPrint(Map<String, dynamic> parameters,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.MINE_FOOTPRINT_DELETE,
          parameters: parameters, );
      if (response['errno'] == 0) {
        onSuccess(Strings.SUCCESS);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future addOrDeleteCollect(Map<String, dynamic> parameters,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.COLLECT_ADD_DELETE,
          parameters: parameters,);
      if (response['errno'] == 0) {
        onSuccess(response["errmsg"]);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future queryCollect(Map<String, dynamic> parameters,
      OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_COLLECT, parameters: parameters, );
      if (response['errno'] == 0) {
        CollectEntity collectEntity = CollectEntity.fromJson(response["data"]);
        onSuccessList(collectEntity.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future queryOrder(Map<String, dynamic> parameters,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_ORDERS, parameters: parameters, );
      if (response['errno'] == 0) {
        OrderEntity orderEntity = OrderEntity.fromJson(response["data"]);
        onSuccess(orderEntity.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }



  Future deleteOrder(Map<String, dynamic> parameters,
    OnSuccess onSuccess, OnFail onFail) async {
  try {
    var response = await HttpUtil.instance
        .post(Api.MINE_ORDER_DELETE, parameters: parameters, );
    if (response["errno"] == 0) {
      onSuccess(Strings.SUCCESS);
    } else {
      onFail(response["errmsg"]);
    }
  } catch (e) {
    print(e);
    onFail(Strings.SERVER_EXCEPTION);
  }
}

  Future cancelOrder(Map<String, dynamic> parameters,
    OnSuccess onSuccess, OnFail onFail) async {
  try {
    var response = await HttpUtil.instance
        .post(Api.MINE_ORDER_CANCEL, parameters: parameters, );
    if (response["errno"] == 0) {
      onSuccess(Strings.SUCCESS);
    } else {
      onFail(response["errmsg"]);
    }
  } catch (e) {
    print(e);
    onFail(Strings.SERVER_EXCEPTION);
  }
}
  Future queryOrderDetail(Map<String, dynamic> parameters,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_ORDER_DETAIL, parameters: parameters,);
      if (response['errno'] == 0) {
        OrderDetailEntity orderDetailEntity =
        OrderDetailEntity.fromJson(response["data"]);
        onSuccess(orderDetailEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}
