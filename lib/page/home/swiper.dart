import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/cached_image.dart';

class SwiperView extends StatelessWidget {
  List<MallBanner> bannerData = new List();
  int size;
  double viewHeight;

  SwiperView(this.bannerData, this.size, this.viewHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewHeight,
      width: double.infinity,
      child: bannerData == null || bannerData.length == 0
          ? Container(
              height: ScreenUtil.instance.setHeight(400.0),
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(Strings.NO_DATA_TEXT),
            )
          : Swiper(
              onTap: (index) {
                NavigatorUtils.goWebView(
                    context, bannerData[index].name, bannerData[index].link);
              },
              itemCount: bannerData.length,
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: false,
              itemBuilder: (BuildContext buildContext, int index) {
                print(bannerData[index].url);
                return CachedImageView(
                    double.infinity, double.infinity, bannerData[index].url);
              },
              duration: 10000,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      size: 8.0,
                      color: Colors.white,
                      activeColor: Colors.deepOrangeAccent)),
            ),
    );
  }
}
