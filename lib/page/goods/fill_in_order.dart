import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/fill_in_order_entity.dart';
import 'package:mall/service/goods_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/item_text.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FillInOrderView extends StatefulWidget {
  @override
  _FillInOrderViewState createState() => _FillInOrderViewState();
}

class _FillInOrderViewState extends State<FillInOrderView> {
  FillInOrderEntity _fillInOrderEntity;
  GoodsService _goodsService = GoodsService();
  TextEditingController _controller = TextEditingController();
  var token;
  Future future;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((onValue) {
      token = onValue;
      _getFillInOrder();
    });
  }

  _getFillInOrder() {
    Options options = Options();
    options.headers["token"] = token;
    var parameters = {
      "cartId": 0,
      "addressId": 0,
      "couponId": 0,
      "grouponRulesId": 0,
    };
    future = _goodsService.cartCheckOut((success) {
      setState(() {
        _fillInOrderEntity = success;
      });
    }, (error) {}, options, parameters);
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
                      style: TextStyle(fontSize: 16.0),
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
          height: ScreenUtil.instance.setHeight(100.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text("实付：¥${_fillInOrderEntity.orderTotalPrice}")),
              InkWell(
                child: Container(
                  width: ScreenUtil.instance.setWidth(150.0),
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    Strings.PAY,
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
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
          Image.network(
            checkedGoods.picUrl,
            width: ScreenUtil.instance.setWidth(140),
            height: ScreenUtil.instance.setWidth(140.0),
          ),
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
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: Row(
        children: <Widget>[
          Text(
            Strings.REMARK,
            style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil.instance.setSp(26.0)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
            child: TextField(
              decoration: InputDecoration(
                hintText: Strings.REMARK,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil.instance.setSp(28.0)),
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(28.0)),
              ),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _fillInOrderEntity.checkedAddress.name,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(28.0)),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
              ),
              Offstage(
                offstage: !_fillInOrderEntity.checkedAddress.isDefault,
                child: Text(
                  Strings.DEFAULT,
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: ScreenUtil.instance.setSp(24.0)),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _fillInOrderEntity.checkedAddress.addressDetail,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
                ),
                Text(
                  _fillInOrderEntity.checkedAddress.tel,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
              ],
            ),
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
    );
  }
}
