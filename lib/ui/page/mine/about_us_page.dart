import 'package:flutter/material.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/ui/widgets/divider_line.dart';
import 'package:mall/ui/widgets/item_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.ABOUT_US),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppStrings.MINE_ABOUT_US_CONTENT,
              style: FMTextStyle.color_333333_size_42,
            ),
            Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(AppDimens.DIMENS_20))),
            DividerLineView(),
            ItemTextView(
                AppStrings.MINE_ABOUT_AUTHOR_TITLE, AppStrings.MINE_ABOUT_AUTHOR),
            DividerLineView(),
            ItemTextView(
                AppStrings.MINE_ABOUT_EMAIL_TITLE, AppStrings.MINE_ABOUT_EMAIL),
            DividerLineView(),
            ItemTextView(AppStrings.MINE_ABOUT_QQ_TITLE, AppStrings.MINE_ABOUT_QQ),
            DividerLineView(),
            ItemTextView(AppStrings.MINE_ABOUT_WX_TITLE, AppStrings.MINE_ABOUT_WX),
            DividerLineView(),
          ],
        ),
      ),
    );
  }
}
