import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/page/home/mall.dart';
import 'package:mall/page/splash/splash.dart';
import 'package:mall/page/goods/category_goods_list.dart';
import 'package:mall/page/login/register.dart';
import 'package:mall/page/login/login.dart';
import 'package:mall/utils/string_util.dart';
import 'package:mall/page/goods/goods_detail.dart';
import 'package:mall/page/goods/fill_in_order.dart';
import 'package:mall/page/mine/address.dart';
import 'package:mall/page/mine/edit_address.dart';
import 'package:mall/page/mine/feedback.dart';
import 'package:mall/page/mine/coupon.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MallMainView();
});

var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SplashView();
});

var categoryGoodsListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  var cateforyName =
      StringUtils.decode(parameters["categoryName"].first).toString();
  print("cateforyName" + cateforyName);
  print("categoryId" + parameters["categoryId"].first);
  var categoryId = int.parse(parameters["categoryId"].first);
  return CategoryListView(categoryName: cateforyName, categoryId: categoryId);
});

var registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return RegisterView();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginView();
});

var goodsDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  var goodsId = int.parse(parameters["goodsId"].first);
  return GoodsDetail(goodsId: goodsId);
});

var fillInOrderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FillInOrderView();
});

var addressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return AddressView();
});

var addressEditHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var addressId = int.parse(parameters["addressId"].first);
  return EditAddressView(addressId);
});
var feedbackHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FeedBackView();
});

var mineCouponHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CouponView();
});
