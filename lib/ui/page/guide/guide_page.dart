import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  var guides = [AppImages.GUIDE_1, AppImages.GUIDE_2, AppImages.GUIDE_3];
  var _showButton = false;

  @override
  Widget build(BuildContext context) {
    SharedPreferencesUtil.getInstance().setBool(AppStrings.IS_FIRST, false);


    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _guideWidget(),
            Positioned(
                right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                child: Offstage(
                  offstage: !_showButton,
                  child: Center(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppDimens.DIMENS_30))),
                    color: AppColors.COLOR_FF5722,
                    textColor: AppColors.COLOR_FFFFFF,
                    onPressed: () {
                      NavigatorUtil.goMallMainPage(context);
                    },
                    child: Text(AppStrings.OPEN_DOOR,
                        style: TextStyle(fontSize: AppDimens.BIG_TEXT_SIZE)),
                  )),
                )),
          ],
        ));
  }

  Widget _guideWidget() {
    return Swiper(
      itemCount: guides.length,
      //item数量
      scrollDirection: Axis.horizontal,
      //滚动方向 设置为Axis.vertical如果需要垂直滚动
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          guides[index],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        );
      },
      autoplay: false,
      //自动滚动
      loop: false,
      //循环滚动
      pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            activeColor: AppColors.COLOR_FF5722, //选中的颜色
            color: AppColors.COLOR_999999, //非选中的颜色
          )),
      onIndexChanged: ((value) {
        //图片数组下标变化监听
        if (value == guides.length - 1) {
          setState(() {
            _showButton = true;
          });
        } else if (_showButton && value != guides.length - 1) {
          //减少非必要的setState 只有当滑动到最后一张图片然后向做滑动的时候触发
          setState(() {
            _showButton = false;
          });
        }
      }),
    );
  }
}
