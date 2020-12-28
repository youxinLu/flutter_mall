import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/ui/widgets/goods_widget.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/category_goods_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryGoodsWidget extends StatefulWidget {
  final int _categoryId;

  CategoryGoodsWidget(this._categoryId);

  @override
  _CategoryGoodsWidgetState createState() => _CategoryGoodsWidgetState();
}

class _CategoryGoodsWidgetState extends State<CategoryGoodsWidget> {
  int _categoryId;
  CategoryGoodsViewModel _categoryGoodsViewModel = CategoryGoodsViewModel();
  int _pageIndex = 1;
  int _pageSize = 6;
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _categoryId = widget._categoryId;
    _categoryGoodsViewModel.queryCategoryGoods(
        _categoryId, _pageIndex, _pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
        right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
      ),
      child: ChangeNotifierProvider<CategoryGoodsViewModel>(
        create: (context) => _categoryGoodsViewModel,
        child:
            Consumer<CategoryGoodsViewModel>(builder: (context, model, child) {
              print("收到通知");
          _pageIndex = model.canLoadMore ? ++_pageIndex : _pageIndex;
          RefreshStateUtil.getInstance()
              .stopRefreshOrLoadMore(_refreshController);
          return showWidget(model);
        }),
      ),
    );
  }

  Widget showWidget(CategoryGoodsViewModel categoryGoodsViewModel) {
    if (categoryGoodsViewModel.pageState == PageState.hasData) {
      return _contentView(categoryGoodsViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        categoryGoodsViewModel, _onRefresh);
  }

  Widget _contentView(CategoryGoodsViewModel categoryGoodsViewModel) {
    return Container(
        child: SmartRefresher(
      enablePullDown: true,
      enablePullUp: _categoryGoodsViewModel.canLoadMore,
      onRefresh: () => _onRefresh(),
      onLoading: () => _onLoadMore(),
      header: WaterDropMaterialHeader(
        backgroundColor: AppColors.COLOR_FF5722,
      ),
      controller: _refreshController,
      child: GridView.builder(
          itemCount: categoryGoodsViewModel.goods.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: ScreenUtil().setWidth(AppDimens.DIMENS_10),
              crossAxisSpacing: ScreenUtil().setHeight(AppDimens.DIMENS_10),
              childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            return GoodsWidget(categoryGoodsViewModel.goods[index], (value) {
              NavigatorUtil.goGoodsDetails(context, value);
            });
          }),
    ));
  }

  void _onRefresh() {
    _pageIndex = 1;
    _categoryGoodsViewModel.queryCategoryGoods(
        _categoryId, _pageIndex, _pageSize);
  }

  void _onLoadMore() {
    _categoryGoodsViewModel.queryCategoryGoods(
        _categoryId, _pageIndex, _pageSize);
  }
}
