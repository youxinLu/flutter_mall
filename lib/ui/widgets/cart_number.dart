import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnNumberChange(int number);

class CartNumberView extends StatefulWidget {
  final OnNumberChange onNumberChange;
  final  _number;

  CartNumberView(this._number, this.onNumberChange);

  @override
  _CartNumberViewState createState() => _CartNumberViewState();
}

class _CartNumberViewState extends State<CartNumberView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(AppDimens.DIMENS_240),
      height: ScreenUtil().setWidth(AppDimens.DIMENS_80),
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () => _reduce(),
              child: Container(
                width: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                height: double.infinity,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: Border(
                        left: BorderSide(
                            color: AppColors.COLOR_F0F0F0, width: 1.0),
                        top: BorderSide(
                            color: AppColors.COLOR_F0F0F0, width: 1.0),
                        right: BorderSide(
                            color: AppColors.COLOR_F0F0F0, width: 1.0),
                        bottom: BorderSide(
                            color: AppColors.COLOR_F0F0F0, width: 1.0))),
                child: Text(
                  "-",
                  style: FMTextStyle.color_333333_size_42
                ),
              )),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: ScreenUtil().setWidth(AppDimens.DIMENS_80),
            decoration: ShapeDecoration(
                shape: Border(
                    top: BorderSide(color: AppColors.COLOR_F0F0F0, width: 1.0),
                    bottom:
                        BorderSide(color: AppColors.COLOR_F0F0F0, width: 1.0))),
            child: Text(
              '${widget._number}',
              style: FMTextStyle.color_333333_size_42
            ),
          ),
          InkWell(
              onTap: () => _add(),
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                height: double.infinity,
                decoration: ShapeDecoration(
                  color: AppColors.COLOR_FF5722,
                    shape: Border(
                        left: BorderSide(
                            color: AppColors.COLOR_FF5722, width: 1.0),
                        top: BorderSide(
                            color: AppColors.COLOR_FF5722, width: 1.0),
                        right: BorderSide(
                            color: AppColors.COLOR_FF5722, width: 1.0),
                        bottom: BorderSide(
                            color: AppColors.COLOR_FF5722, width: 1.0))),
                child: Text(
                  "+",
                  style: FMTextStyle.color_ffffff_size_42
                ),
              )),
        ],
      ),
    );
  }

  _reduce() {
    if (widget._number > 1) {
      widget.onNumberChange(widget._number - 1);
    }
  }

  _add() {
    widget.onNumberChange(widget._number + 1);
  }
}
