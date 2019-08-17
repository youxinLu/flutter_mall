import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:dio/dio.dart';
import 'package:mall/entity/coupon_list_entity.dart';
import 'package:mall/entity/footprint_entity.dart';
import 'package:mall/entity/collect_entity.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnSuccess<T>(T banners);

typedef OnFail(String message);

class MineService {
  Future feedback(Map<String, dynamic> parameters, Options options,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .post(Api.FEED_BACK, parameters: parameters, options: options);
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

  Future couponList(Map<String, dynamic> parameters, Options options,
      OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_COUPON_LIST, parameters: parameters, options: options);
      if (response['errno'] == 0) {
        CouponListEntity couponListEntity =
            CouponListEntity.fromJson(response["data"]);
        onSuccessList(couponListEntity.listData);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future footPrint(Map<String, dynamic> parameters, Options options,
      OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_FOOTPRINT, parameters: parameters, options: options);
      if (response['errno'] == 0) {
        FootprintEntity footprintEntity =
            FootprintEntity.fromJson(response["data"]);
        onSuccessList(footprintEntity.listData);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future deleteFootPrint(Map<String, dynamic> parameters, Options options,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.MINE_FOOTPRINT_DELETE,
          parameters: parameters, options: options);
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

  Future addOrDeleteCollect(Map<String, dynamic> parameters, Options options,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.COLLECT_ADD_DELETE,
          parameters: parameters, options: options);
      if (response['errno'] == 0) {
        onSuccess(response["data"]);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future queryCollect(Map<String, dynamic> parameters, Options options,
      OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.MINE_COLLECT, parameters: parameters, options: options);
      if (response['errno'] == 0) {
        CollectEntity collectEntity = CollectEntity.fromJson(response["data"]);
        onSuccessList(collectEntity.listData);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}
