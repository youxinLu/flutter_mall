import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/item_text.dart';
import 'package:mall/widgets/divider_line.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_ABOUT_US),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.MINE_ABOUT_US_CONTENT,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            Padding(
                padding: EdgeInsets.all(ScreenUtil.instance.setHeight(10.0))),
            DividerLineView(),
            ItemTextView(
                Strings.MINE_ABOUT_AUTHOR_TITLE, Strings.MINE_ABOUT_AUTHOR),
            DividerLineView(),
            ItemTextView(
                Strings.MINE_ABOUT_EMAIL_TITLE, Strings.MINE_ABOUT_EMAIL),
            DividerLineView(),
            ItemTextView(Strings.MINE_ABOUT_QQ_TITLE, Strings.MINE_ABOUT_QQ),
            DividerLineView(),
            ItemTextView(Strings.MINE_ABOUT_WX_TITLE, Strings.MINE_ABOUT_WX),
            DividerLineView(),
          ],
        ),
      ),
    );
  }
}
