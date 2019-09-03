import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/entity/goods_entity.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';

class SearchGoodsView extends StatefulWidget {
  @override
  _SearchGoodsViewState createState() => _SearchGoodsViewState();
}

class _SearchGoodsViewState extends State<SearchGoodsView> {
  TextEditingController _editingController = TextEditingController();
  List<String> _keywords;
  List<GoodsEntity> _goods;
  GoodsService _goodsService = GoodsService();
  var _page = 1;
  var _limit = 10;
  var _sortName = Strings.SORT_NAME;
  var _orderType = Strings.ASC;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor:
          Colors.deepOrangeAccent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setHeight(100.0),
              color: Colors.deepOrangeAccent,
              child: Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(60.0),
                      top: ScreenUtil.instance.setHeight(10.0),
                      bottom: ScreenUtil.instance.setHeight(10.0),
                      right: ScreenUtil.instance.setWidth(60.0)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.white,
                        width: ScreenUtil.instance.setWidth(1.0)),
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(40.0)),
                  ),
                  child: TextField(
                    onEditingComplete: _sort,
                    controller: _editingController,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: ScreenUtil.instance.setWidth(50.0),
                        color: Colors.deepOrangeAccent,
                      ),
                      hintText: Strings.GOODS_SEARCH_HINT,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  )),
            ),
            _sortView(),
            Container(
                height: double.infinity,
                margin:
                    EdgeInsets.only(top: ScreenUtil.instance.setHeight(210.0)),
                child: _goods == null || _goods.length == 0
                    ? EmptyView()
                    : GridView.builder(
                        itemCount: _goods.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisSpacing:
                                ScreenUtil.instance.setWidth(10.0),
                            mainAxisSpacing:
                                ScreenUtil.instance.setHeight(10.0),
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return getGoodsItemView(_goods[index]);
                        }))
          ],
        ),
      ),
    );
  }

  Widget _sortView() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(100.0)),
      height: ScreenUtil.instance.setHeight(100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => _comprehensive(),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              color: Colors.deepOrangeAccent,
                              width: ScreenUtil.instance.setWidth(1.0)))),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.COMPREHENSIVE,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings.SEARCH_GOODS_PRICE,
                      style: TextStyle(
                          fontSize: ScreenUtil.instance.setSp(26.0),
                          color: Colors.black54),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(10.0))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () => _priveSort(1),
                          child: Container(
                            height: ScreenUtil.instance.setHeight(50.0),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              size: ScreenUtil.instance.setHeight(30.0),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => _priveSort(2),
                          child: Container(
                            height: ScreenUtil.instance.setHeight(50.0),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: ScreenUtil.instance.setHeight(30.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  //点击综合
  _comprehensive() {
    _sortName = Strings.SORT_NAME;
    _orderType = Strings.DESC;
    _sort();
  }

  _priveSort(int type) {
    _sortName = Strings.SORT_RETAIL_PRICE;
    _orderType = type == 1 ? Strings.ASC : Strings.DESC;
    _sort();
  }

  _sort() {
    FocusScope.of(context).requestFocus(FocusNode()); //隐藏键盘
    var parameters = {
      "keyword": _editingController.text,
      "page": _page,
      "limit": _limit,
      "sort": _sortName,
      "order": _orderType
    };
    _goodsService.getCategoryGoodsListData(parameters, (onSuccessList) {
      setState(() {
        _goods = onSuccessList;
      });
    }, onFail: (error) {
      ToastUtil.showToast(error);
    });
  }

  _searchKeyWords() {
    var parameters = {"keyword": _editingController.text};
    _goodsService.searchGoods(parameters, (success) {
      setState(() {
        _keywords = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
      setState(() {
        _keywords = null;
      });
    });
  }

  _goGooodsDetail(int goodsId) {
    NavigatorUtils.goGoodsDetails(context, goodsId);
  }

  Widget getGoodsItemView(GoodsEntity goodsEntity) {
    return InkWell(
      onTap: () => _goGooodsDetail(goodsEntity.id),
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: ScreenUtil.getInstance().setWidth(640),
            height: ScreenUtil.getInstance().setHeight(920),
            child: Card(
              child: Column(
                children: <Widget>[
                  CachedImageView(
                      double.infinity,
                      ScreenUtil.getInstance().setHeight(200),
                      goodsEntity.picUrl),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(10.0)),
                  ),
                  Text(
                    goodsEntity.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(26.0), color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:ScreenUtil.getInstance().setHeight(10.0)),
                  ),
                  Text(
                    "¥${goodsEntity.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26.0), color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _keyWordView(String keyword) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
      height: ScreenUtil.instance.setHeight(80.0),
      child: InkWell(
        child: Text(
          keyword,
          style: TextStyle(
              color: Colors.black54, fontSize: ScreenUtil.instance.setSp(26.0)),
        ),
      ),
    );
  }
}
