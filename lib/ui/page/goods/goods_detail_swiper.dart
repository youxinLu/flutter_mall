import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mall/model/goods_detail_entity.dart';

class GoodsDetailSwiper extends StatelessWidget {
  final GoodsDetailEntity _goodsDetailEntity;

  GoodsDetailSwiper(this._goodsDetailEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(AppDimens.DIMENS_600),
      child: Swiper(
        itemCount: _goodsDetailEntity.info.gallery.length,
        scrollDirection: Axis.horizontal,
        //滚动方向，设置为Axis.vertical如果需要垂直滚动
        loop: true,
        //无限轮播模式开关
        index: 0,
        //初始的时候下标位置
        autoplay: false,
        itemBuilder: (BuildContext buildContext, int index) {
          return CachedImageView(double.infinity, double.infinity,
              _goodsDetailEntity.info.gallery[index]);
        },
        duration: 10000,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                size: ScreenUtil().setWidth(AppDimens.DIMENS_18),
                activeSize: ScreenUtil().setWidth(AppDimens.DIMENS_18),
                color: Colors.white,
                activeColor: AppColors.COLOR_FF5722)),
      ),
    );
  }
}
