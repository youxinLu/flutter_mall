import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTextView extends StatelessWidget {
  final leftText;
  final rightText;
  final VoidCallback callback;

  ItemTextView(this.leftText, this.rightText, {this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        color: AppColors.COLOR_FFFFFF,
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
        child: Row(
          children: <Widget>[
            Text(
              leftText,
              style: FMTextStyle.color_333333_size_42,
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                rightText,
                style: FMTextStyle.color_999999_size_42,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
