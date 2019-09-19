import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/entity/order_entity.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  MineService _mineService = MineService();
  List<ListData> _orders = List();
  var _token;
  var _page = 1;
  var _limit = 10;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((value) {
      _token = value;
      _orderData();
    });
  }

  _orderData() {

    var parameters = {"page": _page, "limit": _limit};
    _mineService.queryOrder(parameters,(success) {
      setState(() {
        _orders = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_ORDER),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: _orders.length == 0
            ? EmptyView()
            : ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return _orderItemView(_orders[index]);
                  // return Text("data");
                }),
      ),
    );
  }

  Widget _orderItemView(ListData order) {
    return Card(
        child: InkWell(
            onTap: () => _goOrderDetail(order.id),
            child: Container(
              margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: ScreenUtil.instance.setHeight(80.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shop,
                          size: ScreenUtil.instance.setWidth(60),
                          color: Colors.deepOrangeAccent,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(10.0))),
                        Text(
                          Strings.MALL,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenUtil.instance.setSp(26.0)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(10.0))),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(Strings.MINE_ORDER_SN +
                                        "${order.orderSn}"),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: ScreenUtil.instance.setWidth(40),
                                      color: Colors.grey[350],
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: order.goodsList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _goodItemView(order.goodsList[index]);
//                  return Text("data");
                      }),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(10.0)),
                    alignment: Alignment.centerRight,
                    child: Text(Strings.MINE_ORDER_TOTAL_GOODS +
                        "${goodNumber(order)}" +
                        Strings.MINE_ORDER_GOODS_TOTAL +
                        Strings.MINE_ORDER_PRICE +
                        "${order.actualPrice}"),
                  )
                ],
              ),
            )));
  }

  _goOrderDetail(int orderId) {
    NavigatorUtils.goOrderDetail(context, orderId, _token).then((bool) {
      if (bool) {
        _orderData();
      }
    });
  }

  int goodNumber(ListData order) {
    int number = 0;
    order.goodsList.forEach((good) {
      number += good.number;
    });

    return number;
  }

  Widget _goodItemView(GoodsList good) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            good.picUrl,
            width: ScreenUtil.instance.setWidth(160.0),
            height: ScreenUtil.instance.setHeight(160.0),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                top: ScreenUtil.instance.setHeight(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  good.goodsName,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(10.0))),
                Text(
                  good.specifications[0],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(10.0))),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.all(ScreenUtil.instance.setWidth(6.0)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: new Border.all(
                            color: Colors.deepOrangeAccent,
                            width: ScreenUtil.instance.setWidth(1.0)), // 边色与边宽度
                        color: Colors.deepOrangeAccent, // 底色
                        borderRadius: new BorderRadius.circular(
                            (ScreenUtil.instance.setWidth(20.0))), // 圆角度
                      ),
                      child: Text(
                        Strings.MINE_ORDER_TAG_ONE,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(20.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(10.0)),
                      padding:
                          EdgeInsets.all(ScreenUtil.instance.setWidth(6.0)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: new Border.all(
                            color: Colors.deepOrangeAccent,
                            width: ScreenUtil.instance.setWidth(1.0)), // 边色与边宽度
                        color: Colors.deepOrangeAccent, // 底色
                        borderRadius: new BorderRadius.circular(
                            (ScreenUtil.instance.setWidth(20.0))), // 圆角度
                      ),
                      child: Text(
                        Strings.MINE_ORDER_TAG_TWO,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(20.0)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(20.0),
              right: ScreenUtil.instance.setWidth(20.0),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "¥${good.price}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(24.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(20.0))),
                Text(
                  "X${good.number}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(24.0)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
