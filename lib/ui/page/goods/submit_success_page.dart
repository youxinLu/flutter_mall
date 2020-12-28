import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/router/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.SUBMIT_SUCCESS),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.COLOR_FFFFFF,
        alignment: Alignment.center,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(AppDimens.DIMENS_200))),
            Image.asset(
              AppImages.SUCCESS,
              width: ScreenUtil().setWidth(AppDimens.DIMENS_300),
              height: ScreenUtil().setWidth(AppDimens.DIMENS_300),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(AppDimens.DIMENS_60))),
            Text(
              AppStrings.SUBMIT_SUCCESS,
              style: FMTextStyle.color_333333_size_42,
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(AppDimens.DIMENS_200))),
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                            right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                        child: RaisedButton(
                          splashColor: AppColors.COLOR_FFFFFF,
                          highlightColor: AppColors.COLOR_FFFFFF,
                          highlightElevation: 0,
                          child: Text(
                            AppStrings.BACK_HOME,
                            style: FMTextStyle.color_333333_size_42,
                          ),
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                              context, Routers.root, (route) => false),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.COLOR_DBDBDB),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppDimens.DIMENS_30))),
                          color: AppColors.COLOR_FFFFFF,
                        ))),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                            right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                        child: RaisedButton(
                          splashColor: AppColors.COLOR_FFFFFF,
                          highlightColor: AppColors.COLOR_FFFFFF,
                          highlightElevation: 0,
                          child: Text(
                            AppStrings.CHECK_BILL,
                            style: FMTextStyle.color_333333_size_42,
                          ),
                          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(Routers.orderPage, ModalRoute.withName(Routers.root)),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.COLOR_DBDBDB),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppDimens.DIMENS_30))),
                          color: AppColors.COLOR_FFFFFF,
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
