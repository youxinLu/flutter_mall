import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/router/router_handlers.dart';
import 'package:mall/ui/page/404/not_find_page.dart';

class Routers {
  static String root = "/";
  static String guide = "/guide";
  static String home = "/home";
  static String categoryGoods = "/categoryGoods";

  static String goodsDetail = "/goodsDetail";
  static String login = "/login";
  static String register = "/register";
  static String fillInOrder = "/fillInOrder";
  static String address = "/address";
  static String editAddress = "/editAddress";
  static String coupon = "/coupon";
  static String searchGoods = "/searchGoods";
  static String webView = "/webView";
  static String brandDetail = "/brandDetail";
  static String projectSelectionDetail = "/projectSelectionDetail";
  static String collect = "/collect";
  static String aboutUs = "/aboutUs";
  static String feedBack = "/feedBack";
  static String footPrint = "/footPrint";
  static String submitSuccess = "/submitSuccess";
  static String homeCategoryGoods = "/homeCategoryGoods";
  static String orderPage = "/orderPage";
  static String orderDetailPage = "/orderDetailPage";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      return NotFindPage();
    });

    router.define(root, handler: splashHandler);

    router.define(home, handler: homeHandler);

    router.define(categoryGoods, handler: categoryGoodsListHandler);

    router.define(goodsDetail, handler: goodsDetailsHandler);

    router.define(register, handler: registerHandler);

    router.define(fillInOrder, handler: fillInOrderHandler);

    router.define(login, handler: loginHandler);

    router.define(address, handler: addressHandler);

    router.define(editAddress, handler: editAddressHandler);

    router.define(coupon, handler: couponHandler);

    router.define(searchGoods, handler: searchGoodsHandler);

    router.define(webView, handler: webViewHandler);

    router.define(brandDetail, handler: brandDetailHandler);

    router.define(projectSelectionDetail,
        handler: projectSelectionDetailHandler);

    router.define(collect, handler: collectHandler);

    router.define(aboutUs, handler: aboutUsHandler);

    router.define(feedBack, handler: feedBackHandler);

    router.define(footPrint, handler: footPrintHandler);

    router.define(submitSuccess, handler: submitSuccessHandler);

    router.define(homeCategoryGoods, handler: homeCategoryGoodsHandler);

    router.define(orderPage, handler: orderHandler);

    router.define(orderDetailPage, handler: orderDetailHandler);
  }
}
