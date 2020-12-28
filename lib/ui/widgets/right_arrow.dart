import 'package:flutter/material.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.ARROW_RIGHT,
      height: ScreenUtil().setWidth(AppDimens.DIMENS_60),
      width: ScreenUtil().setWidth(AppDimens.DIMENS_60),
    );
  }
}
