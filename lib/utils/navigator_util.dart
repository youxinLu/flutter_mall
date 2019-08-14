import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/config/application.dart';
import 'package:mall/config/routers.dart';
import 'dart:convert';
import 'package:mall/utils/string_util.dart';

class NavigatorUtils {
  static goMallMainPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.home,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goCategoryGoodsListPage(
      BuildContext context, String categoryName, int categoryId) {
    var categoryNameText = StringUtils.encode(categoryName);

    Application.router.navigateTo(
        context,
        Routers.categoryGoodsList +
            "?categoryName=$categoryNameText&categoryId=$categoryId",
        transition: TransitionType.inFromRight);
  }

  static goRegister(BuildContext context) {
    Application.router.navigateTo(context, Routers.register,
        transition: TransitionType.inFromRight);
  }

  static goLogin(BuildContext context) {
    Application.router.navigateTo(context, Routers.login,
        transition: TransitionType.inFromRight);
  }

  static goGoodsDetails(BuildContext context, int goodsId) {
    Application.router.navigateTo(
        context, Routers.goodsDetail + "?goodsId=$goodsId",
        transition: TransitionType.inFromRight);
  }

  static popRegister(BuildContext context) {
    Application.router.pop(context);
  }

  static goFillInOrder(BuildContext context) {
    Application.router.navigateTo(context, Routers.fillInOrder,
        transition: TransitionType.inFromRight);
  }

  static goAddress(BuildContext context) {
    Application.router.navigateTo(context, Routers.address,
        transition: TransitionType.inFromRight);
  }
}
