import 'package:flutter/material.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/ui/widgets/goods_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHomeGoods extends StatelessWidget {
  List<GoodsEntity> productList;
  String title;

  TabHomeGoods(this.title, this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:ScreenUtil().setWidth(AppDimens.DIMENS_30),right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style:FMTextStyle.color_333333_size_42_bold
            ),
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: productList.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.76,
              crossAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return _getGridViewItem(context, productList[index]);
              }),
        ],
      ),
    );
  }

  _goGoodsDetail(BuildContext context, int goodsId) {
    NavigatorUtil.goGoodsDetails(context, goodsId);
  }

  Widget _getGridViewItem(BuildContext context, GoodsEntity productEntity) {
    return GoodsWidget(productEntity, (value) {
      _goGoodsDetail(context, value);
    });
  }
}
