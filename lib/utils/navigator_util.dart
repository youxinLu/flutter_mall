import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/app_parameters.dart';
import 'package:mall/router/application.dart';
import 'package:mall/router/routers.dart';
import 'dart:convert';

class NavigatorUtil {
  static goMallMainPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.home,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goCategoryGoodsListPage(
      BuildContext context, String categoryName, int categoryId) {
    var categoryNameText = Uri.encodeComponent(jsonEncode(categoryName));
    Application.router.navigateTo(
        context,
        Routers.categoryGoods +
            "?${AppParameters.CATEGORY_NAME}=$categoryNameText&${AppParameters.CATEGORY_ID}=$categoryId",
        transition: TransitionType.inFromRight);
  }

  static goGoodsDetails(BuildContext context, int goodsId) {
    Application.router.navigateTo(
        context, Routers.goodsDetail + "?${AppParameters.GOODS_ID}=$goodsId",
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

  static goFillInOrder(BuildContext context, int cartId) {
    Application.router.navigateTo(
        context, Routers.fillInOrder + "?cartId=$cartId",
        transition: TransitionType.inFromRight);
  }

  // isSelectType 0 点击以后不返回 1  点击以后返回
  static Future goAddress(BuildContext context, int isSelectType) {
    return Application.router.navigateTo(
        context, Routers.address + "?isSelect=$isSelectType",
        transition: TransitionType.inFromRight);
  }

  static Future goAddressEdit(BuildContext context, int addressId) {
    return Application.router.navigateTo(
        context, Routers.editAddress + "?addressId=$addressId",
        transition: TransitionType.inFromRight);
  }

  static Future goCoupon(BuildContext context) {
    return Application.router.navigateTo(context, Routers.coupon,
        transition: TransitionType.inFromRight);
  }

  static goSearchGoods(BuildContext context) {
    return Application.router.navigateTo(context, Routers.searchGoods,
        transition: TransitionType.inFromRight);
  }

  static goWebView(BuildContext context, String titleName, String url) {
    String encodeUrl = Uri.encodeComponent(jsonEncode(url));
    String encodeTitleName = Uri.encodeComponent(jsonEncode(titleName));
    return Application.router.navigateTo(
        context, Routers.webView + "?titleName=$encodeTitleName&url=$encodeUrl",
        transition: TransitionType.inFromRight);
  }

  static goBrandDetail(BuildContext context, String titleName, int id) {
    String encodeTitleName = Uri.encodeComponent(jsonEncode(titleName));
    return Application.router.navigateTo(
        context, Routers.brandDetail + "?titleName=$encodeTitleName&id=$id",
        transition: TransitionType.inFromRight);
  }

  static goProjectSelectionDetailView(BuildContext context, int id) {
    return Application.router.navigateTo(
        context, Routers.projectSelectionDetail + "?id=$id",
        transition: TransitionType.inFromRight);
  }

  static goCollect(BuildContext context) {
    return Application.router.navigateTo(context, Routers.collect,
        transition: TransitionType.inFromRight);
  }

  static goAboutUs(BuildContext context) {
    return Application.router.navigateTo(context, Routers.aboutUs,
        transition: TransitionType.inFromRight);
  }

  static goFeedBack(BuildContext context) {
    return Application.router.navigateTo(context, Routers.feedBack,
        transition: TransitionType.inFromRight);
  }

  static goFootPrint(BuildContext context) {
    return Application.router.navigateTo(context, Routers.footPrint,
        transition: TransitionType.inFromRight);
  }

  static goSubmitSuccess(BuildContext context) {
    return Application.router.navigateTo(context, Routers.submitSuccess,
        transition: TransitionType.inFromRight);
  }

  static goHomeAndClear(BuildContext context) {
    return Application.router.navigateTo(context, Routers.home,
        clearStack: true);
  }

  static goHomeCategoryGoodsPage(BuildContext context, String title, int id) {
    var titleName = Uri.encodeComponent(jsonEncode(title));
    return Application.router.navigateTo(
        context, Routers.homeCategoryGoods + "?title=$titleName&id=$id",
        transition: TransitionType.inFromRight);
  }

  static goOrderPage(BuildContext context, int initIndex) {
    return Application.router.navigateTo(
        context, Routers.orderPage + "?initIndex=$initIndex",
        transition: TransitionType.inFromRight);
  }

  static goOrderDetailPage(BuildContext context, int orderId) {
    return Application.router.navigateTo(
        context, Routers.orderDetailPage + "?orderId=$orderId",
        transition: TransitionType.inFromRight);
  }
}
