import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDataView extends StatelessWidget {

  EmptyDataView();

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppImages.NO_DATA,
                height: ScreenUtil().setWidth(AppDimens.DIMENS_200),
                width: ScreenUtil().setWidth(AppDimens.DIMENS_200),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
              ),
              Text(
                AppStrings.PAGE_EMPTY,
                style: FMTextStyle.color_ff5722_size_42
              )
            ],
          ),
        ),
    );
  }
}
