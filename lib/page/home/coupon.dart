import 'package:flutter/material.dart';
import 'package:mall/entity/home_entity.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:mall/service/home_service.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/utils/shared_preferences_util.dart';

class CouponView extends StatelessWidget {
  List<CouponList> couponList;

  CouponView(this.couponList);

  HomeService _homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: couponList.length,
            itemBuilder: (BuildContext context, int index) {
              return _getCouponView(couponList[index]);
            }));
  }

  Widget _getCouponView(CouponList couponEntity) {
    return Container(
        height: ScreenUtil.instance.setHeight(200.0),
        child: InkWell(
          onTap: () => _recevieCoupon(couponEntity.id),
          child: Card(
            margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.instance.setWidth(200.0),
                  child: Text(
                    "${couponEntity.discount}元",
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(26.0),
                        color: Colors.grey),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: ScreenUtil.instance.setHeight(200.0),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(couponEntity.name),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(10.0)),
                        ),
                        Text("满${couponEntity.min}使用"),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil.instance.setWidth(10.0)),
                        ),
                        Text("有效期${couponEntity.days}天"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _recevieCoupon(int id) {
    SharedPreferencesUtils.getToken().then((value) {
      if (value == null) {
        ToastUtil.showToast(Strings.PLEASE_LOGIN);
      } else {
        var parameters = {"couponId": id};
        _homeService.receiveCoupon(parameters, (success) {
          ToastUtil.showToast(Strings.RECEIVE_COUPON_SUCCESS);
        }, (error) {
          ToastUtil.showToast(error);
        });
      }
    });
  }
}
