import 'package:flutter/material.dart';
import 'package:mall/service/home_service.dart';
import 'package:mall/page/home/swiper.dart';
import 'package:mall/page/home/category.dart';
import 'package:mall/page/home/coupon.dart';
import 'package:mall/constant/string.dart';
import "package:flutter_easyrefresh/easy_refresh.dart";
import 'package:mall/page/home/new_product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/page/home/group_buy.dart';
import 'package:mall/widgets/loading_dialog.dart';
import 'package:mall/widgets/network_error.dart';
import 'package:mall/widgets/futurebuilder_widget.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:mall/page/home/project_selection.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeService _homeService = HomeService();
  HomeEntity _homeEntity;
  EasyRefreshController _controller = EasyRefreshController();
  Future _homeFuture;

  @override
  void initState() {
    super.initState();
    _queryHomeData();
  }

  _queryHomeData() {
    _homeFuture = _homeService.queryHomeData((success) {
      setState(() {
        _homeEntity = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  _goSearchGoods() {
    NavigatorUtils.goSearchGoods(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        //key: ObjectKey("home"),
        appBar: AppBar(
          title: Text("Mall"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => _goSearchGoods())
          ],
        ),
        body: FutureBuilderWidget(_homeFuture, LoadingDialog(),
            NetWorkErrorView(_queryHomeData), contentWidget()));
  }

  Widget contentWidget() {
    return Container(
      child: EasyRefresh(
        controller: _controller,
        header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
        footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
        enableControlFinishRefresh: true,
        enableControlFinishLoad: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SwiperView(_homeEntity.banners, _homeEntity.banners.length,
                  ScreenUtil.instance.setHeight(360.0)),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              CategoryMenu(_homeEntity.categories),
              Container(
                height: 40.0,
                alignment: Alignment.center,
                child: Text(Strings.COUPON_AREA),
              ),
              CouponView(_homeEntity.couponList),
              Container(
                height: 40.0,
                alignment: Alignment.center,
                child: Text(Strings.GROUP_BUG),
              ),
              GroupBuyView(_homeEntity.groupons),
              Container(
                height: 40.0,
                alignment: Alignment.center,
                child: Text(Strings.NEW_PRODUCT),
              ),
              ProductView(_homeEntity.newGoods),
              Container(
                height: 40.0,
                alignment: Alignment.center,
                child: Text(Strings.PROJECT_SELECTIONS),
              ),
              ProjectSelectionView(_homeEntity.projectSelections),
              Container(
                height: 40.0,
                alignment: Alignment.center,
                child: Text(Strings.HOT_PRODUCT),
              ),
              ProductView(_homeEntity.hotGoods),
            ],
          ),
        ),
        onRefresh: () async {
          _queryHomeData();
          _controller.finishRefresh();
        },
      ),
    );
  }
}
