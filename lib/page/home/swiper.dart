import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/home_entity.dart';
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
              height: 200,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(Strings.NO_DATA_TEXT),
            )
          : Swiper(
              itemCount: bannerData.length,
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: true,
              itemBuilder: (BuildContext buildContext, int index) {
                print(bannerData[index].url);
                return Image.network(bannerData[index].url,fit: BoxFit.cover,);
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
