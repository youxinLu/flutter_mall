import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/address_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:dio/dio.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnSuccess<T>(T banners);

typedef OnFail(String message);

class AddressService {
  Future getAddressList( OnSuccess onSuccessList,
      {OnFail onFail}) async {
    try {
      var response =
          await HttpUtil.instance.get(Api.ADDRESS_LIST,);
      if (response['errno'] == 0) {
        AddressEntity addressEntity = AddressEntity.fromJson(response['data']);
        onSuccessList(addressEntity.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future addAddress( Map<String, dynamic> parameters,
      OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance
          .post(Api.ADDRESS_SAVE,  parameters: parameters);
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

  Future deleteAddress(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.post(Api.ADDRESS_DELETE,parameters: parameters);
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

  Future addressDetail(
     Map<String, dynamic> parameters, OnSuccess onSuccess,
      {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.ADDRESS_DETAIL,  parameters: parameters);
      if (response['errno'] == 0) {
        ListData addressDetail = ListData.fromJson(response["data"]);
        onSuccess(addressDetail);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}
