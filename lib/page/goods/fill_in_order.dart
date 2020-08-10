import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/fill_in_order_entity.dart';
import 'package:mall/service/goods_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/item_text.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/fluro_convert_utils.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/cached_image.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mall/event/refresh_event.dart';

class FillInOrderView extends StatefulWidget {
  var cartId;

  FillInOrderView(this.cartId);

  @override
  _FillInOrderViewState createState() => _FillInOrderViewState();
}

class _FillInOrderViewState extends State<FillInOrderView> {
  FillInOrderEntity _fillInOrderEntity;
  GoodsService _goodsService = GoodsService();
  TextEditingController _controller = TextEditingController();
  var token;
  Future future;
  Options options = Options();
  EventBus eventBus = EventBus();

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((onValue) {
      token = onValue;
      _getFillInOrder();
    });
  }

  _getFillInOrder() {
    var parameters = {
      "cartId": widget.cartId == 0 ? 0 : widget.cartId,
      "addressId": 0,
      "couponId": 0,
      "grouponRulesId": 0,
    };
    future = _goodsService.cartCheckOut((success) {
      setState(() {
        _fillInOrderEntity = success;
      });
    }, (error) {}, parameters);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
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
              if (asyncSnapshot.hasError)
                return Container(
                  child: Center(
                    child: Text(
                      Strings.SERVER_EXCEPTION,
                      style:
                          TextStyle(fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  ),
                );
              else
                return _contentWidget();
          }
        });
  }

  _contentWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.FILL_IN_ORDER),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _addressWidget(),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            _couponWidget(),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            _remarkWidget(),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            ItemTextView(
                Strings.GOODS_TOTAL, "¥${_fillInOrderEntity.goodsTotalPrice}"),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey,
            ),
            ItemTextView(
                Strings.FREIGHT, "¥${_fillInOrderEntity.freightPrice}"),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            ItemTextView(
                Strings.GOODS_TOTAL, "¥${_fillInOrderEntity.couponPrice}"),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
//            ListView.builder(itemBuilder: (BuildContext context, int index) {
//              return _goodsItem(_fillInOrderEntity.checkedGoodsList[index]);
//            })
            Column(
              children: _goodsItems(_fillInOrderEntity.checkedGoodsList),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
          height: ScreenUtil.instance.setHeight(100.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text("实付：¥${_fillInOrderEntity.orderTotalPrice}")),
              InkWell(
                onTap: () => _submitOrder(),
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.instance.setWidth(200.0),
                  height: double.infinity,
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    Strings.PAY,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(28.0)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _goodsItems(List<CheckedGoodsList> goods) {
    List<Widget> widgets = List();
    for (int i = 0; i < goods.length; i++) {
      widgets.add(_goodsItem(goods[i]));
      widgets.add(Divider(
        height: ScreenUtil.instance.setHeight(1.0),
        color: Colors.grey[350],
      ));
    }
    return widgets;
  }

  Widget _goodsItem(CheckedGoodsList checkedGoods) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      height: ScreenUtil.instance.setHeight(180.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CachedImageView(ScreenUtil.instance.setWidth(140),
              ScreenUtil.instance.setWidth(140), checkedGoods.picUrl),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                checkedGoods.goodsName,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Text(
                checkedGoods.specifications[0],
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil.instance.setSp(22.0)),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(20.0))),
              Text(
                "¥${checkedGoods.price}",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              )
            ],
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Text("X${checkedGoods.number}"),
          ))
        ],
      ),
    );
  }

  Widget _remarkWidget() {
    return Container(
      height: ScreenUtil.instance.setHeight(80),
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings.REMARK,
            style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil.instance.setSp(26.0)),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
            height: ScreenUtil.instance.setHeight(80.0),
            alignment: Alignment.centerLeft,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: Strings.REMARK,
                //border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: TextStyle(
                    color: Colors.grey[350],
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                hasFloatingPlaceholder: false,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenUtil.instance.setHeight(1.0))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenUtil.instance.setHeight(1.0))),
              ),
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
              controller: _controller,
            ),
          ))
        ],
      ),
    );
  }

  Widget _couponWidget() {
    return Container(
      width: double.infinity,
      height: ScreenUtil.instance.setHeight(100),
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: Row(
        children: <Widget>[
          _fillInOrderEntity.availableCouponLength == 0
              ? Text(
                  Strings.NOT_AVAILABLE_COUPON,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                )
              : Text(
                  Strings.COUPON,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "${_fillInOrderEntity.couponPrice}元",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.instance.setSp(24.0)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _addressWidget() {
    return Container(
      height: ScreenUtil.instance.setHeight(120.0),
      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: _fillInOrderEntity.checkedAddress.id != 0
          ? InkWell(
              onTap: () {
                NavigatorUtils.goAddress(context).then((value) {
                  print(value.toString());
                  Map<String, dynamic> srcJson = new Map();
                  srcJson = FluroConvertUtil.stringToMap(value);
                  setState(() {
                    _fillInOrderEntity.checkedAddress =
                        CheckedAddress.fromJson(srcJson);
                  });
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _fillInOrderEntity.checkedAddress.name,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(28.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setHeight(20.0)),
                          ),
                          Text(
                            _fillInOrderEntity.checkedAddress.tel,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(26.0)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil.instance.setHeight(10.0)),
                      ),
                      Text(
                        _fillInOrderEntity.checkedAddress.province +
                            _fillInOrderEntity.checkedAddress.city +
                            _fillInOrderEntity.checkedAddress.county +
                            _fillInOrderEntity.checkedAddress.addressDetail,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(26.0)),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ))
                ],
              ),
            )
          : InkWell(
              onTap: () {
                NavigatorUtils.goAddress(context).then((value) {
                  print(value.toString());
                  Map<String, dynamic> srcJson = new Map();
                  srcJson = FluroConvertUtil.stringToMap(value);
                  setState(() {
                    _fillInOrderEntity.checkedAddress =
                        CheckedAddress.fromJson(srcJson);
                  });
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Strings.PLEASE_SELECT_ADDRESS,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(30.0)),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ))
                ],
              ),
            ),
    );
  }

  _submitOrder() {
    if (_fillInOrderEntity.checkedAddress.id == 0) {
      ToastUtil.showToast(Strings.PLEASE_SELECT_ADDRESS);
      return;
    }
    var parameters = {
      "cartId": 0,
      "addressId": _fillInOrderEntity.checkedAddress.id,
      "message": _controller.text == null ? "" : _controller.text,
      "couponId": 0,
      "grouponRulesId": 0,
      "grouponLinkId": 0
    };
    _goodsService.submitOrder(options, parameters, (success) {
      print(success);
      eventBus.fire(RefreshEvent());
      ToastUtil.showToast(Strings.SUBMIT_ORDER_SUCCESS);
      NavigatorUtils.submitOrderSuccessPop(context);
    }, (error) {
      ToastUtil.showToast(error);
    });
  }
}
