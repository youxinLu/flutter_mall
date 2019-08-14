import 'package:flutter/material.dart';
import 'package:mall/entity/coupon_entity.dart';
import 'package:mall/constant/string.dart';

class CouponView extends StatelessWidget {
  List<CouponEntity> couponList;

  CouponView(this.couponList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
//      Column(
//        children: <Widget>[
//          Container(
//            height: 40.0,
//            child: Text(Strings.COUPON_AREA),
//          ),
//            couponList == null || couponList.length == 0
//                ? Text("no data")
//                : ListView.builder(
//                    physics: NeverScrollableScrollPhysics(),
//                    shrinkWrap: true,
//                    itemCount: couponList.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return _getCouponView(couponList[index]);
//                    })
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: couponList.length,
            itemBuilder: (BuildContext context, int index) {
              return _getCouponView(couponList[index]);
            })
        //],
        //),
        );
  }

  Widget _getCouponView(CouponEntity couponEntity) {
    return Container(
      height: 100.0,
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 100.0,
              child: Text(
                "${couponEntity.discount}元",
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 100.0,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(couponEntity.name),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("满${couponEntity.min}使用"),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Text("有效期${couponEntity.days}天"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
