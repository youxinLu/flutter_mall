import 'package:flutter/material.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/entity/goods_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        key: ObjectKey("${categoryId}"),
        body: Container(
      child: Center(
        child: goodsEntitys != null && goodsEntitys.length != 0
            ? GridView.builder(
                itemCount: goodsEntitys == null ? 0 : goodsEntitys.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return getGoodsItemView(goodsEntitys[index]);
                })
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
                          fontSize: 16.0, color: Colors.deepOrangeAccent),
                    )
                  ],
                ),
              ),
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
                  CachedImageView(
                    double.infinity,
                    ScreenUtil.getInstance().setHeight(200.0),
                    goodsEntity.picUrl,
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
