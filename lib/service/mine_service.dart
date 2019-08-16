import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/address_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:dio/dio.dart';

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
}
