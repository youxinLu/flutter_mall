import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTextArrowView extends StatelessWidget {
  final String iconPath;
  final title;
  final VoidCallback callback;

  IconTextArrowView(
    this.iconPath,
    this.title,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
        width: double.infinity,
        child: InkWell(
          highlightColor: AppColors.COLOR_FFFFFF,
          splashColor: AppColors.COLOR_FFFFFF,
          onTap: callback,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                child: Image.asset(
                  iconPath,
                  width: ScreenUtil().setWidth(AppDimens.DIMENS_60),
                  height: ScreenUtil().setWidth(AppDimens.DIMENS_60),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
              ),
              Text(
                title,
                style:FMTextStyle.color_333333_size_42
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.COLOR_999999,
                    size: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
