import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/app_parameters.dart';
import 'package:mall/ui/page/goods/category_goods_page.dart';
import 'package:mall/ui/page/goods/fill_in_order_page.dart';
import 'package:mall/ui/page/goods/goods_detail_page.dart';
import 'package:mall/ui/page/goods/home_category_goods_page.dart';
import 'package:mall/ui/page/goods/search_goods_page.dart';
import 'package:mall/ui/page/goods/submit_success_page.dart';
import 'package:mall/ui/page/home/brand_detail_page.dart';
import 'package:mall/ui/page/home/home_page.dart';
import 'package:mall/ui/page/404/not_find_page.dart';
import 'package:mall/ui/page/home/main_page.dart';
import 'package:mall/ui/page/home/project_selection_detail_page.dart';
import 'package:mall/ui/page/login/login_page.dart';
import 'package:mall/ui/page/login/register_page.dart';
import 'package:mall/ui/page/mine/about_us_page.dart';
import 'package:mall/ui/page/mine/address_detail_page.dart';
import 'package:mall/ui/page/mine/collect_page.dart';
import 'package:mall/ui/page/mine/coupon_page.dart';
import 'package:mall/ui/page/mine/feedback_page.dart';
import 'package:mall/ui/page/mine/foot_print_page.dart';
import 'package:mall/ui/page/mine/order_detail_page.dart';
import 'package:mall/ui/page/mine/order_page.dart';
import 'package:mall/ui/widgets/webview_widget.dart';
import 'package:mall/ui/page/mine/address_page.dart';
import 'dart:convert';

//引导页
var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MainPage();
});

//首页
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return HomePage();
});

//404页面
var notFindHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return NotFindPage();
});

var categoryGoodsListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  var categoryName = jsonDecode(parameters[AppParameters.CATEGORY_NAME].first);
  var categoryId = int.parse(parameters[AppParameters.CATEGORY_ID].first);
  return CategoryGoodsPage(categoryName, categoryId);
});

var goodsDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  var goodsId = int.parse(parameters[AppParameters.GOODS_ID].first);
  return GoodsDetailPage(goodsId);
});
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginPage();
});

var registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return RegisterPage();
});
var fillInOrderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var cartId = int.parse(parameters[AppParameters.CART_ID].first);
  return FillInOrderPage(cartId);
});

var addressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var isSelect = int.parse(parameters["isSelect"].first);
  return AddressViewPage(isSelect);
});

var editAddressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var addressId = int.parse(parameters["addressId"].first);
  return AddressDetailPage(addressId);
});

var couponHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CouponPage();
});

var searchGoodsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SearchGoodsPage();
});

var webViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var title = jsonDecode(parameters["titleName"].first);
  var url = jsonDecode(parameters["url"].first);
  return WebViewPage(url, title);
});

var brandDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var title = jsonDecode(parameters["titleName"].first);
  var id = int.parse(parameters["id"].first);
  return BrandDetailPage(title, id);
});

var projectSelectionDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var id = int.parse(parameters["id"].first);
  return ProjectSelectionDetailView(id);
});

var collectHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CollectPage();
});

var aboutUsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return AboutUsPage();
});

var feedBackHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FeedBackPage();
});

var footPrintHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FootPrintPage();
});

var submitSuccessHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SubmitSuccessPage();
});

var homeCategoryGoodsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var title = jsonDecode(parameters["title"].first);
  var id = int.parse(parameters["id"].first);
  return HomeCategoryGoodsPage(title, id);
});

var orderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var initIndex =
      int.parse(parameters.length == 0 ? "0" : parameters["initIndex"].first);
  return OrderPage(initIndex);
});

var orderDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var orderId = int.parse(parameters["orderId"].first);
  return OrderDetailPage(orderId);
});
