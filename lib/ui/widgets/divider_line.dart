import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerLineView extends StatelessWidget {
  double height;

  DividerLineView({this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.COLOR_EAEAEA,
      indent: 0,
      endIndent: 0,
      height:   ScreenUtil().setHeight(height == null ? AppDimens.DIMENS_1 : height),
      thickness:
      ScreenUtil().setHeight(height == null ? AppDimens.DIMENS_1 : height),
    );
  }
}
