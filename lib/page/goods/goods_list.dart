import 'package:flutter/material.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/entity/goods_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/utils/navigator_util.dart';

class GoodsList extends StatefulWidget {
  int categoryId;

  GoodsList(this.categoryId);

  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  GoodsService goodsService = GoodsService();
  List<GoodsEntity> goodsEntitys = List();
  var categoryId;

  _getGoodsData(int categoryId) {
    goodsService.getCategoryGoodsListData(
        {"categoryId": categoryId, "page": 1, "limit": 100}, (goodsEntityList) {
      setState(() {
        goodsEntitys = goodsEntityList;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    if (goodsEntitys == null || goodsEntitys.length == 0) {
      categoryId = widget.categoryId;
      _getGoodsData(categoryId);
      print("GoodsList_initState");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("销毁GoodsList");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: ObjectKey("${categoryId}"),
        body: Container(
          child: Center(
            child: goodsEntitys == null || goodsEntitys.length == 0
                ? Center(
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
                              fontSize: 16.0, color: Colors.deepOrangeAccent),
                        )
                      ],
                    ),
                  )
                : GridView.builder(
                    itemCount: goodsEntitys == null ? 0 : goodsEntitys.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 6.0,
                        childAspectRatio: 1.1),
                    itemBuilder: (BuildContext context, int index) {
                      return getGoodsItemView(goodsEntitys[index]);
                    }),
          ),
        ));
  }

  Widget getGoodsItemView(GoodsEntity goodsEntity) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: 320,
            height: 460,
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    goodsEntity.picUrl,
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    goodsEntity.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    "¥${goodsEntity.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            )),
      ),
      onTap: () => _itemClick(goodsEntity.id),
    );
  }

  _itemClick(int id) {
    NavigatorUtils.goGoodsDetails(context, id);
  }
}
