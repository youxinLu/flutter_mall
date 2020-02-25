import 'package:mall/entity/banner_entity.dart';
import 'package:mall/utils/http_util.dart';
import 'package:mall/api/api.dart';
import 'package:mall/entity/category_entity.dart';
import 'package:mall/entity/coupon_entity.dart';
import 'package:mall/entity/group_buy_entity.dart';
import 'package:mall/entity/product_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/entity/brand_detail_entity.dart';

typedef OnSuccessList<T>(List<T> banners);

typedef OnFail(String message);

typedef OnSuccess<T>(T successData);

class HomeService {
  Future getBannerData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.BANNER_URL);

      if (response['errno'] == 0) {
        responseList = response['data'];
        print(responseList);
        BannerListEntity bannerListEntity =
            BannerListEntity.fromJson(responseList);
        onSuccessList(bannerListEntity.bannerEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getCategoryData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.CATEGORY_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        CategoryListEntity categoryListEntity =
            CategoryListEntity.fromJson(responseList);
        onSuccessList(categoryListEntity.categoryEntityList);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getCouponData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.COUPON_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        CouponListEntity couponListEntity =
            CouponListEntity.fromJson(responseList);
        onSuccessList(couponListEntity.couponEntityList);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getGroupBy(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.GROUP_BY_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        GroupBuyListEntity groupBugListEntity =
            GroupBuyListEntity.fromJson(responseList);
        onSuccessList(groupBugListEntity.groupBuyEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getNewProduct(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.HOME_PRODUCT_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        ProductListEntity productListEntity =
            ProductListEntity.fromJson(responseList);
        onSuccessList(productListEntity.productEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future getHotProduct(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(Api.HOME_HOT_PRODUCT_URL);
      if (response['errno'] == 0) {
        responseList = response['data'];
        ProductListEntity productListEntity =
            ProductListEntity.fromJson(responseList);
        onSuccessList(productListEntity.productEntitys);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future queryHomeData(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(Api.HOME_URL);
      if (response['errno'] == 0) {
        HomeEntity homeEntity = HomeEntity.fromJson(response['data']);
        onSuccess(homeEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future queryBrandDetail(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.get(Api.BRAND_DETAIL, parameters: parameters);
      if (response['errno'] == 0) {
        BrandDetailEntity brandDetailEntity =
            BrandDetailEntity.fromJson(response['data']);
        onSuccess(brandDetailEntity);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future receiveCoupon(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response =
          await HttpUtil.instance.post(Api.RECEIVE_COUPON, parameters: parameters);
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
