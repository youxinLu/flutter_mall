import 'package:flutter/material.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/entity/goods_detail_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/goods/detail_swiper.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/cart_number.dart';
import 'package:mall/event/refresh_event.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/widgets/cached_image.dart';

class GoodsDetail extends StatefulWidget {
  int goodsId;

  GoodsDetail({Key key, @required this.goodsId}) : super(key: key);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  int goodsId;
  GoodsService _goodsService = GoodsService();
  MineService _mineService = MineService();
  GoodsDetailEntity _goodsDetail;
  var parameters;

  Animation<double> animation;
  String specifications; //规格
  int _specificationIndex = 0;
  int _number = 1;
  var _goodsDetailFuture;
  var token;
  var _isCollection = false;

  @override
  void initState() {
    super.initState();
    goodsId = widget.goodsId;
    var params = {"id": goodsId};
    print("GoodsDetail_initState");
    _goodsDetailFuture =
        _goodsService.getGoodsDetailData(params, (goodsDetail) {
      _goodsDetail = goodsDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.GOODS_DETAIL),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: _goodsDetailFuture,
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
                    return _detailView();
              }
            }),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => _collection(),
                        child: Icon(
                          Icons.star_border,
                          color: _isCollection
                              ? Colors.deepOrangeAccent
                              : Colors.grey,
                          size: 30.0,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: InkWell(
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.deepOrangeAccent,
                          size: 30.0,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.deepOrangeAccent,
                      child: InkWell(
                          onTap: () => openBottomSheet(
                              context, _goodsDetail.productList[0], 1),
                          child: Center(
                            child: Text(
                              Strings.ADD_CART,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          )),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                      color: Colors.red,
                      child: InkWell(
                          onTap: () => openBottomSheet(
                              context, _goodsDetail.productList[0], 2),
                          child: Center(
                            child: Text(
                              Strings.BUY,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openBottomSheet(BuildContext context, ProductList productList, int showType) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            height: ScreenUtil.instance.setHeight(630.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CachedImageView(
                            ScreenUtil.instance.setWidth(120.0),
                            ScreenUtil.instance.setWidth(120.0),
                            productList.url),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Strings.PRICE + "：" + "${productList.price}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: ScreenUtil.instance.setSp(24.0)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(10.0)),
                            ),
                            Text(Strings.ALREAD_SELECTED +
                                "：" +
                                _goodsDetail.productList[0]
                                    .specifications[_specificationIndex])
                          ],
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
                    child: Text(
                      Strings.SPECIFICATIONS,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(30.0)),
                    ),
                  ),
                  Wrap(
                      children:
                          _specificationsWidget(productList.specifications)),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(10.0)),
                  ),
                  Container(
                    margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
                    child: Text(
                      Strings.NUMBER,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(30.0)),
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
                      height: ScreenUtil.instance.setHeight(80),
                      alignment: Alignment.centerLeft,
                      child: CartNumberView(1, (number) {
                        print("${number}");
                      })),
                  Expanded(
                      child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.instance.setHeight(100.0),
                        width: double.infinity,
                        child: InkWell(
                            onTap: () => showType == 1 ? _addCart() : _buy(),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.deepOrangeAccent,
                              child: Text(
                                showType == 1 ? Strings.ADD_CART : Strings.BUY,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(30.0)),
                              ),
                            )),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          );
        });
  }

  List<Widget> _specificationsWidget(List<String> specifications) {
    List<Widget> specificationsWidget = List();
    for (int i = 0; i < specifications.length; i++) {
      specificationsWidget.add(Container(
          padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
          child: InkWell(
            child: Chip(
              label: Text(
                specifications[i],
                style: TextStyle(
                    color: i == _specificationIndex
                        ? Colors.white
                        : Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(24.0)),
              ),
              backgroundColor: i == _specificationIndex
                  ? Colors.deepOrangeAccent
                  : Colors.grey,
            ),
          )));
    }
    return specificationsWidget;
  }

  _addCart() {
    SharedPreferencesUtils.getToken().then((value) {
      if (value != null) {
        parameters = {
          "goodsId": _goodsDetail.info.id,
          "productId": _goodsDetail.specificationList[0].valueList[0].id,
          "number": _number
        };
        _goodsService.addCart(parameters, (value) {
          ToastUtil.showToast(Strings.ADD_CART_SUCCESS);
          Navigator.of(context).pop(); //隐藏弹出框
          eventBus.fire(RefreshEvent());
        }, );
      } else {
        NavigatorUtils.goLogin(context);
      }
    });
  }

  _buy() {
        if (SharedPreferencesUtils.token != null) {
          parameters = {
            "goodsId": _goodsDetail.info.id,
            "productId": _goodsDetail.specificationList[0].valueList[0].id,
            "number": _number,
            "grouponRulesId":0,
            "grouponLinkId":0
          };
          _goodsService.buy(parameters, (success) {
            NavigatorUtils.goFillInOrder(context, success);
          }, (error) {});
        } else {
          NavigatorUtils.goLogin(context);
        }
  }

  _collection() {
    SharedPreferencesUtils.getToken().then((value) {
      if (value == null) {
        NavigatorUtils.goLogin(context);
      } else {
        token = value;
        _addOrDeleteCollect();
      }
    });
  }

  _addOrDeleteCollect() {
    Options options = Options();
    options.headers["X-Litemall-Token"] = token;
    var parameters = {"type": 0, "valueId": _goodsDetail.info.id};
    _mineService.addOrDeleteCollect(parameters, (onSuccess) {
      setState(() {
        _isCollection = true;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  Widget _detailView() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        ListView(
          children: <Widget>[
            DetailSwiperView(_goodsDetail.info.gallery,
                _goodsDetail.info.gallery.length, 240.0),
            Divider(
              height: 2.0,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _goodsDetail.info.name,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                  ),
                  Text(
                    _goodsDetail.info.brief,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "原价：${_goodsDetail.info.counterPrice}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Text(
                        "现价：${_goodsDetail.info.retailPrice}",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent, fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
            ),
            _goodsDetail.attribute == null || _goodsDetail.attribute.length == 0
                ? Divider()
                : Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          Strings.COMMODITY_PARAMETERS,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                        ),
                        _attributeView(_goodsDetail),
                      ],
                    ),
                  ),
            Html(data: _goodsDetail.info.detail),
            _goodsDetail.issue == null || _goodsDetail.issue.length == 0
                ? Divider()
                : Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          Strings.COMMON_PROBLEM,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                        ),
                        _issueView(_goodsDetail),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  //商品属性Widget
  Widget _attributeView(GoodsDetailEntity goodsDetail) {
    print("${goodsDetail.attribute.length}");
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: goodsDetail.attribute.length,
        itemBuilder: (BuildContext context, int index) {
          return _attributeItemView(goodsDetail.attribute[index]);
        });
  }

  Widget _attributeItemView(Attribute attribute) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                attribute.attribute,
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    attribute.value,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                )),
          ],
        ));
  }

  //常见问题
  Widget _issueView(GoodsDetailEntity goodsDetail) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: goodsDetail.issue.length,
        itemBuilder: (BuildContext context, int index) {
          return _issueItemView(goodsDetail.issue[index]);
        });
  }

  Widget _issueItemView(Issue issue) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
        padding: EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              issue.question,
              style: TextStyle(color: Colors.black54, fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  issue.answer,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                )),
          ],
        ));
  }
}

//class AnimatedImage extends AnimatedWidget {
//  AnimatedImage({Key key, Animation<double> animation})
//      : super(key: key, listenable: animation);
//
//  Widget build(BuildContext context) {
//    final Animation<double> animation = listenable;
//    return new Center(
//      child: Image.asset("images/splash.png",
//          width: animation.value, height: animation.value),
//    );
//  }
//}
