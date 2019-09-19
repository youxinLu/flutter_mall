import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/entity/coupon_list_entity.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/mall_icon.dart';

class CouponView extends StatefulWidget {
  @override
  _CouponViewState createState() => _CouponViewState();
}

class _CouponViewState extends State<CouponView> {
  MineService _mineService = MineService();
  List<ListData> _couponList = List();
  var token;
  var page = 1;
  var limit = 20;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((onValue) {
      if (onValue != null) {
        token = onValue;
        _getCouponData();
      }
    });
  }

  _getCouponData() {
    var parameters = {"page": page, "limit": limit};
    _mineService.couponList(parameters, (onSuccess) {
      setState(() {
        _couponList = onSuccess;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_COUPON),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: ListView.builder(
            itemCount: _couponList.length,
            itemBuilder: (BuildContext context, int index) {
              return _couponItemView(_couponList[index]);
            }),
      ),
    );
  }

  Widget _couponItemView(ListData coupon) {
    return Container(
        height: ScreenUtil.instance.setHeight(190.0),
        margin: EdgeInsets.only(
          top: ScreenUtil.instance.setHeight(10.0),
        ),
        child: Card(
          margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
         child: Container(
           padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Icon(
                 MallIcon.COUPON,
                 size: ScreenUtil.instance.setWidth(100),
                 color: Colors.deepOrangeAccent,
               ),
               Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(30.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${coupon.discount}" + Strings.unit,
                                style: TextStyle(
                                    fontSize: ScreenUtil.instance.setSp(30.0),
                                    color: Colors.deepOrangeAccent),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil.instance.setWidth(10.0)),
                              ),
                              Text(
                                Strings.FULL +
                                    "${coupon.min}" +
                                    Strings.REDUCE +
                                    "${coupon.discount}",
                                style: TextStyle(
                                    fontSize: ScreenUtil.instance.setSp(24.0),
                                    color: Colors.deepOrangeAccent),
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(10.0))),
                          Text(
                            coupon.name + coupon.desc,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(26.0)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(10.0))),
                          Text(
                            coupon.startTime + "-" + coupon.endTime,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(26.0)),
                          ),
                        ],
                      ))
                  ),
             ],
           ),
         ),
        ));
  }
}
