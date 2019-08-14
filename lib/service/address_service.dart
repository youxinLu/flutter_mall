import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/address_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:dio/dio.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnSuccess<T>(T banners);

typedef OnFail(String message);

class AddressService {
  Future getAddressList(Options options, OnSuccess onSuccessList,
      {OnFail onFail}) async {
    try {
      var response =
          await HttpUtil.instance.get(Api.ADDRESS_LIST, options: options);
      if (response['errno'] == 0) {
        AddressEntity addressEntity = AddressEntity.fromJson(response['data']);
        onSuccessList(addressEntity.listData);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future addAddress(Options options, OnSuccess onSuccess,
      {OnFail onFail}) async {
    try {
      var response =
          await HttpUtil.instance.get(Api.ADDRESS_SAVE, options: options);
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

  Future deleteAddress(Options options, OnSuccess onSuccess,
      {OnFail onFail}) async {
    try {
      var response =
      await HttpUtil.instance.get(Api.ADDRESS_DELETE, options: options);
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
