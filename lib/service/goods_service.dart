import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/sub_category_entity.dart';
import 'package:mall/entity/goods_entity.dart';
import 'package:mall/entity/goods_detail_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:dio/dio.dart';
import 'package:mall/entity/cart_list_entity.dart';
import 'package:mall/entity/fill_in_order_entity.dart';
import 'package:mall/entity/search_key_entity.dart';
import 'package:mall/entity/project_selection_detail_entity.dart';
import 'package:mall/entity/project_selection_recommed_entity.dart';

typedef OnSuccessList<T>(List<T> banners);
typedef OnFail(String message);
typedef OnSuccess<T>(T onSuccess);

class GoodsService {
  Future getCategoryData(
      Map<String, dynamic> parameters, OnSuccessList onSuccessList,
      {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance
          .get(Api.GOODS_CATEGORY_URL, parameters: parameters);
      if (response['errno'] == 0) {
        responseList = response['data'];
        SubCategoryListEntity subCategoryListEntity =
            SubCategoryListEntity.fromJson(responseList);
        onSuccessList(subCategoryListEntity.subCategoryEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getCategoryGoodsListData(
      Map<String, dynamic> parameters, OnSuccessList onSuccessList,
      {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance
          .get(Api.GOODS_LIST_URL, parameters: parameters);
      if (response['errno'] == 0) {
        responseList = response['data']['list'];
        GoodsListEntity goodsListEntitys =
            GoodsListEntity.fromJson(responseList);
        onSuccessList(goodsListEntitys.goodsEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getGoodsDetailData(
      Map<String, dynamic> parameters, OnSuccess onSuccess,
      {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.GOODS_DETAILS_URL, parameters: parameters);
      if (response['errno'] == 0) {
        GoodsDetailEntity goodsDetailEntity =
            GoodsDetailEntity.fromJson(response['data']);
        onSuccess(goodsDetailEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future addCart(Map<String, dynamic> parameters, OnSuccess onSuccess,
      {OnFail onFail, Options options}) async {
    try {
      var response;
      if (options == null) {
        response =
            await HttpUtil.instance.post(Api.ADD_CART, parameters: parameters);
      } else {
        response = await HttpUtil.instance
            .post(Api.ADD_CART, parameters: parameters, options: options);
      }
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

  Future queryCart(OnSuccess onSuccess,
      {OnFail onFail, Options options}) async {
    try {
      var response;
      response = await HttpUtil.instance.get(Api.CART_LIST, options: options);
      if (response['errno'] == 0) {
        CartListEntity cartList = CartListEntity.fromJson(response['data']);
        onSuccess(cartList);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future deleteCart(OnSuccess onSuccess, OnFail onFail,
      Map<String, dynamic> parameters) async {
    try {
      var response;
      response = await HttpUtil.instance
          .post(Api.CART_DELETE,  parameters: parameters);
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

  Future updateCart(OnSuccess onSuccess, OnFail onFail, Options options,
      Map<String, dynamic> parameters) async {
    try {
      var response;
      response = await HttpUtil.instance
          .post(Api.CART_UPDATE, options: options, parameters: parameters);
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

  Future cartCheck(OnSuccess onSuccess, OnFail onFail,
      Map<String, dynamic> parameters) async {
    try {
      var response = await HttpUtil.instance
          .post(Api.CART_CHECK,parameters: parameters);
      if (response['errno'] == 0) {
        CartListEntity cartList = CartListEntity.fromJson(response['data']);
        onSuccess(cartList);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future cartCheckOut(OnSuccess onSuccess, OnFail onFail,
      Map<String, dynamic> parameters) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.CART_BUY, parameters: parameters);
      if (response['errno'] == 0) {
        FillInOrderEntity fillInOrderEntity =
            FillInOrderEntity.fromJson(response['data']);
        onSuccess(fillInOrderEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future submitOrder(
    Options options,
    Map<String, dynamic> parameters,
    OnSuccess onSuccess,
    OnFail onFail,
  ) async {
    try {
      var response = await HttpUtil.instance
          .post(Api.SUBMIT_ORDER, parameters: parameters, options: options);
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

  Future searchGoods(
    Map<String, dynamic> parameters,
    OnSuccessList onSuccessList,
    OnFail onFail,
  ) async {
    try {
      var response =
          await HttpUtil.instance.get(Api.SEARCH_GOODS, parameters: parameters);
      if (response['errno'] == 0) {
        onSuccessList(SearchKeyEntity.fromJson(response["data"]).keyword);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future projectSelectionDetail(
    Map<String, dynamic> parameters,
    OnSuccess onSuccess,
    OnFail onFail,
  ) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.PROJECT_SELECTION_DETAIL, parameters: parameters);
      if (response['errno'] == 0) {
        onSuccess(ProjectSelectionDetailEntity.fromJson(response["data"]));
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future projectSelectionRecommend(
    Map<String, dynamic> parameters,
    OnSuccess onSuccess,
    OnFail onFail,
  ) async {
    try {
      var response = await HttpUtil.instance
          .get(Api.PROJECT_SELECTION_RECOMMEND, parameters: parameters);
      if (response['errno'] == 0) {
        onSuccess(ProjectSelectionRecommedEntity.fromJson(response["data"]));
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
  Future buy(
      Map<String, dynamic> parameters,
      OnSuccess onSuccess,
      OnFail onFail,
      ) async {
    try {
      var response = await HttpUtil.instance
          .post(Api.FAST_BUY, parameters: parameters,);
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
}
