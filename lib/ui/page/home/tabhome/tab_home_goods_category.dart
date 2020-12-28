import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHomeGoodsCategory extends StatelessWidget {
  List<HomeModelChannel> _homeModelChannel;

  TabHomeGoodsCategory(this._homeModelChannel);

  _goCategoryView(BuildContext context, HomeModelChannel channel) {
    print("${channel.id}");
    NavigatorUtil.goHomeCategoryGoodsPage(context, channel.name, channel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
            bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
        color: AppColors.COLOR_FFFFFF,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          //禁止滚动
          shrinkWrap: true,

          //Vertical viewport was given unbounded height.  Column 中且套GridView、ListView的问题
          itemCount: _homeModelChannel.length,
          itemBuilder: (BuildContext context, int index) {
            //  return _getGridViewItem(categoryList[index]);
            return _getGridViewItem(context, _homeModelChannel[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            //单个子Widget的水平最大宽度
            crossAxisCount: 5,
            //水平单个子Widget之间间距
            mainAxisSpacing: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            //垂直单个子Widget之间间距
            crossAxisSpacing: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          ),
        ));
  }

  Widget _getGridViewItem(BuildContext context, HomeModelChannel channel) {
    return Center(
      child: InkWell(
        onTap: () => _goCategoryView(context, channel),
        child: Column(
          children: <Widget>[
            CachedImageView(ScreenUtil().setWidth(AppDimens.DIMENS_120),
                ScreenUtil().setWidth(AppDimens.DIMENS_120), channel.iconUrl),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(AppDimens.DIMENS_10)),
            ),
            Text(
              channel.name,
              style: FMTextStyle.color_333333_size_42,
            )
          ],
        ),
      ),
    );
  }
}
