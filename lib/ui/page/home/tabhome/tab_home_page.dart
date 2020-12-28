import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_brand.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_coupon.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_goods.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_goods_category.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_banner.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_group_by.dart';
import 'package:mall/ui/page/home/tabhome/tab_home_special.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:mall/view_model/tab_home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage>
    with SingleTickerProviderStateMixin {
  TabHomeViewModel _model = TabHomeViewModel();
  VoidCallback callback;
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _onRefresh(); //获取首页数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => NavigatorUtil.goSearchGoods(context),
            )
          ],
          title: Text(AppStrings.APP_NAME),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider<TabHomeViewModel>(
          create: (context) => _model,
          child: Consumer<TabHomeViewModel>(builder: (context, model, child) {
            _refreshController.refreshCompleted();
            return RefreshConfiguration(
              child: SmartRefresher(
                  header: WaterDropMaterialHeader(
                    backgroundColor: AppColors.COLOR_FF5722,
                  ),
                  controller: _refreshController,
                  onRefresh: ()=>_onRefresh(),
                  child: initView(model)),
            );
          }),
        ));
  }

  _onRefresh() {
    _model.loadTabHomeData(); //获取首页数据
  }

  //appbar
  Widget appBarWidget() {
    return SliverAppBar(
        floating: true,
        pinned: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => NavigatorUtil.goSearchGoods(context),
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(AppStrings.APP_NAME),
        ));
  }

  Widget initView(TabHomeViewModel tabHomeViewModel) {
    if (tabHomeViewModel.pageState == PageState.hasData) {
      return _dataView(tabHomeViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        tabHomeViewModel, _onRefresh);
  }

  //数据显示
  Widget _dataView(TabHomeViewModel tabHomeViewModel) {
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            TabHomeBanner(_model.homeModelEntity.banner),
            TabHomeGoodsCategory(_model.homeModelEntity.channel),
            TabHomeCoupon(_model.homeModelEntity.couponList, _model),
            TabHomeGroupByWidget(_model.homeModelEntity.grouponList),
            TabHomeGoods(
                AppStrings.NEW_PRODUCTS, _model.homeModelEntity.newGoodsList),
            TabHomeGoods(
                AppStrings.HOT_SALE, _model.homeModelEntity.hotGoodsList),
            TabHomeGoods(AppStrings.AT_HOME,
                _model.homeModelEntity.floorGoodsList[0].goodsList),
            TabHomeGoods(AppStrings.KITCHEN,
                _model.homeModelEntity.floorGoodsList[1].goodsList),
            TabHomeGoods(AppStrings.DIET,
                _model.homeModelEntity.floorGoodsList[2].goodsList),
            TabHomeGoods(AppStrings.PARTS,
                _model.homeModelEntity.floorGoodsList[3].goodsList),
            TabHomeSpecial(
                AppStrings.SPECIAL, _model.homeModelEntity.topicList),
            TabHomeBrand(
                AppStrings.MANUFACTURING, _model.homeModelEntity.brandList)
          ],
        ));
  }
}
