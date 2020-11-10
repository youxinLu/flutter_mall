import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/config/router_handlers.dart';

class Routers {
  static String root = "/";
  static String home = "/home";
  static String categoryGoodsList = "/categoryGoodsList";
  static String goodsDetail = "/goodsDetail";
  static String login = "/login";
  static String register = "/register";
  static String fillInOrder = "/fillInOrder";
  static String address = "/myAddress";
  static String addressEdit = "/addressEdit";
  static String feedback = "/feedback";
  static String mineCoupon = "/mineCoupon";
  static String mineFootprint = "/mineFootprint";
  static String mineCollect = "/mineCollect";
  static String aboutUs = "/aboutUs";
  static String mineOrder = "/mineOrder";
  static String mineOrderDetail = "/mineOrderDetail";
  static String searchGoods = "/searchGoods";
  static String projectSelectionDetail = "/projectSelectionDetail";
  static String webView = "/webView";
  static String brandDetail = "/brandDetail";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      print("handler not find");
    });

    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(categoryGoodsList, handler: categoryGoodsListHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(goodsDetail, handler: goodsDetailsHandler);
    router.define(fillInOrder, handler: fillInOrderHandler);
    router.define(address, handler: addressHandler);
    router.define(addressEdit, handler: addressEditHandler);
    router.define(feedback, handler: feedbackHandler);
    router.define(mineCoupon, handler: mineCouponHandler);
    router.define(mineFootprint, handler: footPrintHandler);
    router.define(mineCollect, handler: collectHandler);
    router.define(aboutUs, handler: aboutHandler);
    router.define(mineOrder, handler: orderHandler);
    router.define(mineOrderDetail, handler: orderDetailHandler);
    router.define(searchGoods, handler: searchGoodsHandler);
    router.define(projectSelectionDetail,
        handler: projectSelectionDetailHandler);
    router.define(webView, handler: webViewHandler);
    router.define(brandDetail, handler: brandDetailHandler);
  }
}
