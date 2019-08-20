import 'package:flutter/material.dart';
import 'package:mall/service/home_service.dart';
import 'package:mall/entity/banner_entity.dart';
import 'package:mall/page/home/swiper.dart';
import 'package:mall/entity/category_entity.dart';
import 'package:mall/page/home/category.dart';
import 'package:mall/entity/coupon_entity.dart';
import 'package:mall/page/home/coupon.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/home/group_buy.dart';
import 'package:mall/entity/group_buy_entity.dart';
import 'package:mall/entity/product_entity.dart';
import 'package:mall/page/home/new_product.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeService homeService = HomeService();
  List<BannerEntity> bannerEntitys = List();
  List<CategoryEntity> categoryEntityList = List();
  List<CouponEntity> couponEntityList = List();
  List<GroupBuyEntity> groupBuyList = List();
  List<ProductEntity> productList = List();
  List<ProductEntity> hotProductList = List();
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: true);
    _getBannerData();
    _getCategory();
    _getCoupon();
    //_getGroupBuy();
    _getNewProduct();
    _getHotProduct();
    print("homePage_initState");
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() {}

  _getBannerData() {
    homeService.getBannerData((bannerEntity) {
      print(bannerEntity.length);
      setState(() {
        bannerEntitys = bannerEntity;
      });
    });
  }

  _getCategory() {
    homeService.getCategoryData((categoryEntitys) {
      print(categoryEntitys.length);
      setState(() {
        categoryEntityList = categoryEntitys;
      });
    });
  }

  _getCoupon() {
    homeService.getCouponData((couponEntitys) {
      print(couponEntitys.length);
      setState(() {
        couponEntityList = couponEntitys;
      });
    });
  }

  _getGroupBuy() {
    homeService.getGroupBy((groupBuyEntitys) {
      print(groupBuyEntitys.length);
      setState(() {
        groupBuyList = groupBuyEntitys;
      });
    });
  }

  _getNewProduct() {
    homeService.getNewProduct((productEntitys) {
      print(productEntitys.length);
      setState(() {
        productList = productEntitys;
      });
    });
  }

  _getHotProduct() {
    homeService.getHotProduct((productEntitys) {
      print(productEntitys.length);
      setState(() {
        hotProductList = productEntitys;
      });
    });
  }
  _goSearchGoods()
  {
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
              onPressed: ()=>_goSearchGoods())
        ],
      ),
      body: bannerEntitys == null || bannerEntitys.length == 0
          ? SpinKitFoldingCube(
              size: 40.0,
              color: Colors.deepOrangeAccent,
            )
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: WaterDropMaterialHeader(
                color: Colors.white,
                backgroundColor: Colors.white,
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView(
                children: <Widget>[
                  SwiperView(bannerEntitys, bannerEntitys.length, 200.0),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  CategoryMenu(categoryEntityList),
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.COUPON_AREA),
                  ),
                  CouponView(couponEntityList),
//                  Container(
//                    height: 40.0,
//                    alignment: Alignment.center,
//                    child: Text(Strings.GROUP_BUG),
//                  ),
//                  GroupBuyView(groupBuyList),
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.NEW_PRODUCT),
                  ),
                  ProductView(productList),
                  Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(Strings.HOT_PRODUCT),
                  ),
                  ProductView(hotProductList),
                ],
              ),
            ),
    );
  }
}
