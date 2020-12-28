import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/event/tab_select_event.dart';
import 'package:mall/ui/widgets/divider_line.dart';
import 'package:mall/ui/widgets/icon_text_arrow_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/view_model/user_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TabMinePage extends StatefulWidget {
  @override
  _TabMinePageState createState() => _TabMinePageState();
}

class _TabMinePageState extends State<TabMinePage> {
  @override
  Widget build(BuildContext context) {
    return _contentWidget();
  }

  Widget _contentWidget() {
    return Consumer<UserViewModel>(
        builder: (BuildContext context, UserViewModel model, Widget child) {
          print("");
      return Stack(children: [
        Container(
            height: ScreenUtil().setHeight(AppDimens.DIMENS_600) +
                MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.COLOR_FFB24E, AppColors.COLOR_FF5722]),
                color: AppColors.COLOR_FF5722,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        ScreenUtil().setWidth(AppDimens.DIMENS_80)),
                    bottomRight: Radius.circular(
                        ScreenUtil().setWidth(AppDimens.DIMENS_80))))),
        Container(
            padding:
                EdgeInsets.all(ScreenUtil().setHeight(AppDimens.DIMENS_30)),
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(AppDimens.DIMENS_100)),
            child: Column(children: [
              _headWidget(model),
              _userDataWidget(model),
              _orderWidget(),
              _otherWidget(),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_120))),
              _logoutWidget()
            ]))
      ]);
    });
  }

  Widget _headWidget(UserViewModel model) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(AppDimens.DIMENS_180),
            height: ScreenUtil().setWidth(AppDimens.DIMENS_180),
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
            child: CircleAvatar(
              radius: ScreenUtil().setWidth(AppDimens.DIMENS_90),
              backgroundImage: NetworkImage(
                Provider.of<UserViewModel>(context).pictureUrl ??
                    AppStrings.DEFAULT_URL,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.userName ?? "---",
                  style: FMTextStyle.color_ffffff_size_42),
              Text(
                AppStrings.SUPER_VIP,
                style: FMTextStyle.color_ffffff_size_36,
              ),
            ],
          ),
        ]);
  }

  Widget _userDataWidget(UserViewModel model) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(AppDimens.DIMENS_40)),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${model.couponNumber}",
                        style: FMTextStyle.color_ffffff_size_42),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_30))),
                    Text(AppStrings.COUPON,
                        style: FMTextStyle.color_ffffff_size_42),
                  ],
                ),
                onTap: () => NavigatorUtil.goCoupon(context),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${model.collectionNumber}",
                        style: FMTextStyle.color_ffffff_size_42),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_30))),
                    Text(AppStrings.COLLECTION,
                        style: FMTextStyle.color_ffffff_size_42),
                  ],
                ),
                onTap: () => NavigatorUtil.goCollect(context),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => NavigatorUtil.goFootPrint(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${model.footPrintfNumber}",
                        style: FMTextStyle.color_ffffff_size_42),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_30))),
                    Text(AppStrings.MINE_FOOTPRINT,
                        style: FMTextStyle.color_ffffff_size_42),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _orderWidget() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_10)),
      child: Card(
        color: AppColors.COLOR_FFFFFF,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.DIMENS_10))),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                  right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
              child: Row(
                children: [
                  Text(AppStrings.MINE_ORDER,
                      style: FMTextStyle.color_333333_size_42),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            splashColor: AppColors.COLOR_FFFFFF,
                            highlightColor: AppColors.COLOR_FFFFFF,
                            onTap: () => _goOrderPage(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(AppStrings.CHECK_ALL_ORDER,
                                    style: FMTextStyle.color_999999_size_36),
                                Image.asset(
                                  AppImages.ARROW_RIGHT,
                                  width: ScreenUtil()
                                      .setWidth(AppDimens.DIMENS_30),
                                  height: ScreenUtil()
                                      .setWidth(AppDimens.DIMENS_30),
                                ),
                              ],
                            ),
                          )))
                ],
              ),
            ),
            DividerLineView(),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
              height: ScreenUtil().setHeight(AppDimens.DIMENS_190),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => _goOrderPage(1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.TO_BE_PAID,
                              width:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                              height:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil()
                                        .setHeight(AppDimens.DIMENS_20))),
                            Text(AppStrings.TO_BE_PAID,
                                style: FMTextStyle.color_333333_size_36),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => _goOrderPage(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.TO_BE_DELIVERED,
                              width:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                              height:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil()
                                        .setHeight(AppDimens.DIMENS_20))),
                            Text(AppStrings.TO_BE_DELIVERED,
                                style: FMTextStyle.color_333333_size_36),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => _goOrderPage(3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.RECEIVED,
                              width:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                              height:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil()
                                        .setHeight(AppDimens.DIMENS_20))),
                            Text(AppStrings.TO_BE_RECEIVED,
                                style: FMTextStyle.color_333333_size_36),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => _goOrderPage(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.TO_BE_EVALUATED,
                              width:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                              height:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_100),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil()
                                        .setHeight(AppDimens.DIMENS_20))),
                            Text(AppStrings.TO_BE_EVALUATED,
                                style: FMTextStyle.color_333333_size_36),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _otherWidget() {
    return Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_10)),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppDimens.DIMENS_10))),
            child: Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                  right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
              child: Column(
                children: [
                  IconTextArrowView(AppImages.LOCATION, AppStrings.LOCATION,
                      () => NavigatorUtil.goAddress(context, 0)),
                  DividerLineView(),
                  IconTextArrowView(AppImages.FEEDBACK, AppStrings.FEED_BACK,
                      () => NavigatorUtil.goFeedBack(context)),
                  DividerLineView(),
                  IconTextArrowView(AppImages.ABOUT_US, AppStrings.ABOUT_US,
                      () => NavigatorUtil.goAboutUs(context)),
                ],
              ),
            )));
  }

  Widget _logoutWidget() {
    return SizedBox(
        width: double.infinity,
        height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.DIMENS_30))),
          color: AppColors.COLOR_FF5722,
          onPressed: () => _logout(),
          child:
              Text(AppStrings.LOGOUT, style: FMTextStyle.color_ffffff_size_42),
        ));
  }

  _goOrderPage(int initIndex) {
    NavigatorUtil.goOrderPage(context, initIndex);
  }

  _logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Text(AppStrings.TIPS, style: FMTextStyle.color_333333_size_60),
            content: Text(AppStrings.CONFIRM_LOGOUT,
                style: FMTextStyle.color_333333_size_48),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppStrings.CANCEL,
                      style: FMTextStyle.color_999999_size_42)),
              FlatButton(
                  onPressed: () {
                    SharedPreferencesUtil.getInstance().clear().then((value) {
                      print(value);
                      if (value) {
                        Navigator.pop(context);
                        Provider.of<UserViewModel>(context, listen: false)
                            .refreshData();
                        tabSelectBus.fire(TabSelectEvent(0));
                      }
                    });
                  },
                  child: Text(AppStrings.CONFIRM,
                      style: FMTextStyle.color_ff5722_size_42)),
            ],
          );
        });
  }

}
