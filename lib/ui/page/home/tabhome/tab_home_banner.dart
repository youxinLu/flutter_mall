import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TabHomeBanner extends StatelessWidget {
  List<HomeModelBanner> _bannerData;

  TabHomeBanner(this._bannerData);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColors.COLOR_F0F0F0,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_480),
      width: double.infinity,
      child: _bannerData == null || _bannerData.length == 0
          ? Image.asset(
              AppImages.DEFAULT_PICTURE,
            )
          : Swiper(
              onTap: (index) {
                NavigatorUtil.goWebView(
                    context, _bannerData[index].name, _bannerData[index].link);
              },
              itemCount: _bannerData.length,
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: false,
              itemBuilder: (BuildContext buildContext, int index) {
                print(_bannerData[index].url);
                return CachedImageView(
                    double.infinity, double.infinity, _bannerData[index].url);
              },
              duration: 5000,
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
