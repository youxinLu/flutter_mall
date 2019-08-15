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

  static void configureRoutes(Router router) {
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
  }
}
