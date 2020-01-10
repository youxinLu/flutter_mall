import 'package:flutter/material.dart';
import 'package:mall/service/mine_service.dart';
import 'package:dio/dio.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/item_text.dart';
import 'package:mall/entity/order_detail_entity.dart';
import 'package:mall/widgets/divider_line.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/utils/toast_util.dart';

class OrderDetail extends StatefulWidget {
  var orderId;
  var token;

  OrderDetail(this.orderId, this.token);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  MineService _mineService = MineService();
  OrderDetailEntity _orderDetailEntity;
  Future _orderDetailFuture;
  var action;
  var parameters;

  @override
  void initState() {
    super.initState();

    parameters = {"orderId": widget.orderId};
    _queryOrderDetail();
  }

  _queryOrderDetail() {
    _orderDetailFuture =
        _mineService.queryOrderDetail(parameters,(success) {
      _orderDetailEntity = success;
    }, (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_ORDER_DETAIL),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: _orderDetailFuture,
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            switch (asyncSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
                  child: Center(
                    child: SpinKitFoldingCube(
                      size: 40.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                );
              default:
                if (asyncSnapshot.hasError) {
                  return Container(
                    height: double.infinity,
                    child: EmptyView(),
                  );
                } else {
                  return _contentView();
                }
            }
          }),
    );
  }

  Widget _contentView() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemTextView(
              Strings.MINE_ORDER_SN, _orderDetailEntity.orderInfo.orderSn),
          DividerLineView(),
          ItemTextView(
              Strings.MINE_ORDER_TIME, _orderDetailEntity.orderInfo.addTime),
          DividerLineView(),
          Container(
              margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
              height: ScreenUtil.instance.setHeight(80.0),
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Strings.ORDER_INFORMATION,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26)),
                  ),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Offstage(
                            offstage: _orderDetailEntity.orderInfo.handleOption.cancel,
                            child: Text(
                              Strings.MINE_ORDER_ALREADY_CANCEL,
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: ScreenUtil.instance.setSp(26.0)),
                            ),
                          )))
                ],
              )),
          DividerLineView(),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _orderDetailEntity.orderGoods.length,
              itemBuilder: (BuildContext context, int index) {
                return _goodItemView(_orderDetailEntity.orderGoods[index]);
              }),
          DividerLineView(),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                top: ScreenUtil.instance.setHeight(20.0),
                bottom: ScreenUtil.instance.setHeight(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      _orderDetailEntity.orderInfo.consignee,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0)),
                    ),
                    Text(
                      _orderDetailEntity.orderInfo.mobile,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(20.0))),
                Text(
                  _orderDetailEntity.orderInfo.address,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                  softWrap: true,
                ),
              ],
            ),
          ),
          DividerLineView(),
          ItemTextView(Strings.MINE_ORDER_DETAIL_TOTAL,
              Strings.DOLLAR + "${_orderDetailEntity.orderInfo.goodsPrice}"),
          DividerLineView(),
          ItemTextView(Strings.FREIGHT,
              Strings.DOLLAR + "${_orderDetailEntity.orderInfo.freightPrice}"),
          DividerLineView(),
          ItemTextView(Strings.MINE_ORDER_DETAIL_PREFERENCES,
              Strings.DOLLAR + "${_orderDetailEntity.orderInfo.couponPrice}"),
          DividerLineView(),
          ItemTextView(Strings.MINE_ORDER_DETAIL_PAYMENTS,
              Strings.DOLLAR + "${_orderDetailEntity.orderInfo.actualPrice}"),
          DividerLineView(),
          Container(
            height: ScreenUtil.instance.setHeight(100.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    action = 1;
                    _showDialog();
                  },
                  child: Text(
                    Strings.CANCEL,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(28.0),
                        color: Colors.white),
                  ),
                )),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(60.0)),
                ),
                Expanded(
                    child: MaterialButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    action = 2;
                    _showDialog();
                  },
                  child: Text(
                    Strings.DELETE,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(28.0),
                        color: Colors.white),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _goodItemView(OrderGoods good) {
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

  _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              Strings.TIPS,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            content: Text(
              action == 1
                  ? Strings.MINE_ORDER_CANCEL_TIPS
                  : Strings.MINE_ORDER_DELETE_TIPS,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            actions: <Widget>[
              FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    Strings.CANCEL,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(24.0)),
                  )),
              FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    if (action == 1) {
                      _cancelOrder();
                    } else {
                      _deleteOrder();
                    }
                  },
                  child: Text(
                    Strings.CONFIRM,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(24.0)),
                  )),
            ],
          );
        });
  }

  _deleteOrder() {
    var parameters = {"orderId": widget.orderId};
    _mineService.deleteOrder(parameters, (success) {
      Navigator.of(context).pop(true);
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  _cancelOrder() {
    var parameters = {"orderId": widget.orderId};
    _mineService.cancelOrder(parameters,  (success) {
      ToastUtil.showToast(Strings.MINE_ORDER_CANCEL_SUCCESS);
      setState(() {
        _orderDetailEntity.orderInfo.handleOption.cancel = false;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }
}
