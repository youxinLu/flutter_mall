import 'package:flutter/material.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/entity/cart_list_entity.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/cart_number.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/event/refresh_event.dart';
import 'package:mall/event/cart_number_event.dart';
import 'package:mall/widgets/cached_image.dart';
import 'package:mall/event/login_event.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  GoodsService _goodsService = GoodsService();
  List<CartList> _cartList;
  CartListEntity cartListEntity;
  bool _isLogin = false;
  bool _isAllCheck = false;
  double _totalMoney = 0.0;
  var token;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((onValue) {
      if (onValue == null) {
        setState(() {
          _isLogin = false;
        });
      } else {
        token = onValue;
        _getCartData(onValue);
      }
    });
  }

  _getCartData(token) {
    Options options = Options();
    //   options.headers[Strings.TOKEN] = token;
    _goodsService.queryCart((cartList) {
      setState(() {
        _isLogin = true;
        cartListEntity = cartList;
        _cartList = cartListEntity.cartList;
      });
      _isAllCheck = _checkedAll();
      print("_getCartItemView${_cartList.length}");
    }, options: options);
  }

  _refreshEvent() {
    eventBus
        .on<RefreshEvent>()
        .listen((RefreshEvent refreshEvent) => _getCartData(token));
    loginEventBus.on<LoginEvent>().listen((LoginEvent loginEvent) {
      if (loginEvent.isLogin) {
        _getCartData(SharedPreferencesUtils.token);
      } else {
        setState(() {
          _isLogin = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshEvent();
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.CART),
          centerTitle: true,
        ),
        body: _isLogin && _cartList != null
            ? Container(
                child: _cartList.length != 0
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (BuildContext context, int index) {
                                print("_getCartItemView itemBuilder");
                                return _getCartItemView(index);
                              }),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(120.0),
                            decoration: ShapeDecoration(
                                shape: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 1.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                    value: _isAllCheck,
                                    activeColor: Colors.deepOrangeAccent,
                                    onChanged: (bool) {
                                      _setCartItemCheck(bool);
                                    }),
                                Container(
                                  width:
                                      ScreenUtil.getInstance().setWidth(200.0),
                                  child: Text(Strings.TOTAL_MONEY +
                                      "${cartListEntity.cartTotal.checkedGoodsAmount}"),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil.getInstance()
                                          .setWidth(30.0)),
                                  alignment: Alignment.centerRight,
                                  child: RaisedButton(
                                    onPressed: () {
                                      _fillInOrder();
                                    },
                                    color: Colors.deepOrangeAccent,
                                    child: Text(
                                      Strings.SETTLEMENT,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(26.0)),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/no_data.png",
                              height: 80,
                              width: 80,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                            Text(
                              Strings.NO_DATA_TEXT,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.deepOrangeAccent),
                            )
                          ],
                        ),
                      ),
              )
            : Container(
                child: Center(
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      NavigatorUtils.goLogin(context);
                    },
                    child: Text(
                      Strings.LOGIN,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.getInstance().setSp(30.0)),
                    ),
                  ),
                ),
              ));
  }

  _fillInOrder() {
    NavigatorUtils.goFillInOrder(context, 0);
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return TestWidaget();
//    })).then((value) => print(value));
  }

  Widget _getCartItemView(int index) {
    print("_getCartItemView${index}");

    return Container(
      height: ScreenUtil.getInstance().setHeight(180.0),
      width: double.infinity,
      child: InkWell(
        onLongPress: () => _deleteDialog(index),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  value: _cartList[index].checked ?? true,
                  activeColor: Colors.deepOrangeAccent,
                  onChanged: (bool) {
                    _checkCart(index, bool);
                  }),
              CachedImageView(
                  ScreenUtil.getInstance().setWidth(140.0),
                  ScreenUtil.getInstance().setWidth(140.0),
                  _cartList[index].picUrl),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _cartList[index].goodsName,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(24.0),
                        color: Colors.black54),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(10.0))),
                  Text(
                    "¥${_cartList[index].price}",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(24.0),
                        color: Colors.grey),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(
                    right: ScreenUtil.getInstance().setWidth(20.0)),
                alignment: Alignment.centerRight,
                child: CartNumberView(_cartList[index].number, (value) {
                  _updateCart(index, value);
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _updateCart(int index, int number) {
    Options options = Options();
    //  options.headers[Strings.TOKEN] = token;
    var parameters = {
      "productId": _cartList[index].productId,
      "goodsId": _cartList[index].goodsId,
      "number": number,
      "id": _cartList[index].id,
    };
    _goodsService.updateCart((success) {
      setState(() {
        _cartList[index].number = number;
      });
    }, (error) {
      ToastUtil.showToast(error);
      cartNumberEventBus.fire(CartNumberEvent(number - 1));
    }, options, parameters);
  }

  _checkCart(int index, bool isCheck) {
    var parameters = {
      "productIds": [_cartList[index].productId],
      "isChecked": isCheck ? 1 : 0,
    };
    _goodsService.cartCheck((success) {
      setState(() {
        cartListEntity = success;
        _cartList = cartListEntity.cartList;
        _isAllCheck = _checkedAll();
      });
      _totalMoney = cartListEntity.cartTotal.goodsAmount;
    }, (error) {
      ToastUtil.showToast(error);
    }, parameters);
  }

  _deleteDialog(int index) {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(Strings.TIPS),
            content: Text(Strings.DELETE_CART_ITEM_TIPS),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  Strings.CANCEL,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              FlatButton(
                onPressed: () {
                  _deleteGoods(index);
                },
                child: Text(
                  Strings.CONFIRM,
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              )
            ],
          );
        });
  }

  _deleteGoods(int index) {
    var parameters = {
      "productIds": [_cartList[index].productId]
    };
    _goodsService.deleteCart((success) {
      ToastUtil.showToast(Strings.DELETE_SUCCESS);
      setState(() {
        _cartList.removeAt(index);
      });
      Navigator.pop(context);
    }, (error) {
      ToastUtil.showToast(error);
    }, parameters);
  }

  bool _checkedAll() {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].checked == null || !_cartList[i].checked) {
        return false;
      }
    }
    return true;
  }

  _setCartItemCheck(bool checked) {
    setState(() {
      _isAllCheck = checked;
      for (int i = 0; i < _cartList.length; i++) {
        _cartList[i].checked = checked;
      }
    });
  }

  _getTotalAmount() {
    double amount = 0;
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].checked) {
        amount += (_cartList[i].price * _cartList[i].number);
      }
    }
    return amount;
  }
}
