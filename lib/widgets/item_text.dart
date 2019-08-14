import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTextView extends StatelessWidget {
  var leftText;
  var rightText;
  VoidCallback callback;

  ItemTextView(this.leftText, this.rightText, {this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20.0),
            right: ScreenUtil.instance.setWidth(20.0)),
        height: ScreenUtil.instance.setHeight(80.0),
        child: Row(
          children: <Widget>[
            Text(
              leftText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                rightText,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
