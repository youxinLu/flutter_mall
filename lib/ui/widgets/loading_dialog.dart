import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatelessWidget {
  String title; //提示文本
  double titleSize = AppDimens.DIMENS_42; //文本字体大小
  Color textColor = AppColors.COLOR_999999; //文本颜色
  double indicatorRadius = AppDimens.DIMENS_60; // 圆形进度的半径

  LoadingDialog(
      {String title,double titleSize = AppDimens.DIMENS_42,Color textColor = AppColors.COLOR_999999, double indicatorRadius = AppDimens.DIMENS_60});

  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: AppColors.COLOR_TRANSPARENT,
          child: Center(
            child: SizedBox(
              height: ScreenUtil().setHeight((AppDimens.DIMENS_20 +
                  (2*indicatorRadius ).toDouble()+
                  titleSize +
                  AppDimens.DIMENS_60)),
              width: ScreenUtil().setHeight(AppDimens.DIMENS_400),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: ShapeDecoration(
                    color: AppColors.COLOR_FFFFFF,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppDimens.DIMENS_10),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(
                        animating: true,
                        radius: ScreenUtil().setHeight(indicatorRadius),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            ScreenUtil().setHeight(AppDimens.DIMENS_20)),
                      ),
                      Text(
                        title == null ? AppStrings.LOADING : title,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(titleSize),
                            color: textColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
