import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/ui/widgets/goods_widget.dart';
import 'package:mall/ui/widgets/loading_dialog.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:mall/view_model/search_goods_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:collection/collection.dart';

class SearchGoodsPage extends StatefulWidget {
  @override
  _SearchGoodsPageState createState() => _SearchGoodsPageState();
}

class _SearchGoodsPageState extends State<SearchGoodsPage> {
  TextEditingController _keyController = TextEditingController();
  SearchGoodsViewModel _searchGoodsViewModel = SearchGoodsViewModel();
  RefreshController _refreshController = RefreshController();
  FocusNode _focusNode = FocusNode();
  var _pageIndex = 1;
  var _pageSize = 10;
  var _sortName = AppStrings.SORT_NAME;
  var _orderType = AppStrings.DESC;

  @override
  void initState() {
    super.initState();
    _searchGoodsViewModel.pageState = PageState.empty;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _searchGoodsViewModel,
        child: Selector<SearchGoodsViewModel, List<GoodsEntity>>(
          builder: (context, provider, child) {
            if (_searchGoodsViewModel.isLoadMore) {
              _pageIndex++;
            }
            RefreshStateUtil.getInstance()
                .stopRefreshOrLoadMore(_refreshController);
            return Scaffold(
              appBar: AppBar(
                title: _searchWidget(),
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48.0),
                  child: _conditionWidget(),
                ),
              ),
              body: _contentWidget(),
            );
          },
          selector: (context, provider) => provider.goods,
        ));
  }

  Widget _searchWidget() {
    return Container(
      height: AppBar().preferredSize.height,
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
          bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
      alignment: Alignment.center,
      color: AppColors.COLOR_FF5722,
      child: Container(
          margin: EdgeInsets.only(
              right: ScreenUtil().setWidth(AppDimens.DIMENS_100)),
          decoration: BoxDecoration(
            color: AppColors.COLOR_FFFFFF,
            border: Border.all(
                color: AppColors.COLOR_FFFFFF,
                width: ScreenUtil().setWidth(AppDimens.DIMENS_1)),
            borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(AppBar().preferredSize.height / 2)),
          ),
          child: TextField(
            onEditingComplete: _sort,
            controller: _keyController,
            textInputAction: TextInputAction.search,
            focusNode: _focusNode,
            style: FMTextStyle.color_333333_size_42,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                color: AppColors.COLOR_FF5722,
              ),
              hintText: AppStrings.GOODS_SEARCH_HINT,
              hintStyle: FMTextStyle.color_999999_size_42,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          )),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog(
            title: AppStrings.LOGINING,
            textColor: AppColors.COLOR_999999,
            titleSize: AppDimens.DIMENS_42,
            indicatorRadius: AppDimens.DIMENS_60,
          );
        });
  }

  Widget _conditionWidget() {
    return Container(
      color: AppColors.COLOR_FFFFFF,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Selector<SearchGoodsViewModel, bool>(
                builder: (context, data, child) {
              return GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.PUBLISH_TIME,
                      style: FMTextStyle.color_333333_size_42,
                    ),
                    Icon(
                      _searchGoodsViewModel.publishTimeConditionArrowUp
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.COLOR_999999,
                    ),
                  ],
                ),
                onTap: () => _showPublishTimeDialog(),
              );
            }, selector: (context, model) {
              return model.publishTimeConditionArrowUp;
            }),
          ),
          Expanded(
            flex: 1,
            child: Selector<SearchGoodsViewModel, bool>(
                builder: (context, data, child) {
              return GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.PRICE_CONDITION,
                      style: FMTextStyle.color_333333_size_42,
                    ),
                    Icon(
                      _searchGoodsViewModel.priceConditionArrowUp
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.COLOR_999999,
                    ),
                  ],
                ),
                onTap: () => _showPriceDialog(),
              );
            }, selector: (context, model) {
              return model.priceConditionArrowUp;
            }),
          ),
        ],
      ),
    );
  }

  Widget _contentWidget() {
    return SmartRefresher(
      enablePullUp: _searchGoodsViewModel.isLoadMore,
      enablePullDown: true,
      header: WaterDropMaterialHeader(
        backgroundColor: AppColors.COLOR_FF5722,
      ),
      controller: _refreshController,
      child: _showWidget(_searchGoodsViewModel),
      onRefresh: _onRefresh,
      onLoading: _onLoadMore,
    );
  }

  Function deepEq = const DeepCollectionEquality().equals;

  Widget _showWidget(SearchGoodsViewModel searchGoodsViewModel) {
    if (searchGoodsViewModel.pageState == PageState.hasData) {
      return _goodsWidget();
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        searchGoodsViewModel, _onRefresh);
  }

  _showPublishTimeDialog() {
    _focusNode.unfocus();
    _searchGoodsViewModel.setPublishTimeCondition();
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.DIMENS_20),
                topRight: Radius.circular(AppDimens.DIMENS_20))),
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setHeight(AppDimens.DIMENS_300),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                    child: GestureDetector(
                      onTap: () {
//                        _orderType = AppStrings.ASC;
//                        _sortName = AppStrings.PUBLISH_TIME;
//                        _onRefresh();
                        Navigator.pop(context);
                      },
                      child: Text(AppStrings.PUBLISH_TIME_ASC,
                          style: FMTextStyle.color_333333_size_42),
                    )),
                Container(
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                    child: GestureDetector(
                      onTap: () {
//                        _orderType = AppStrings.DESC;
//                        _sortName = AppStrings.PUBLISH_TIME;
//                        _onRefresh();
                        Navigator.pop(context);
                      },
                      child: Text(AppStrings.PUBLISH_TIME_DESC,
                          style: FMTextStyle.color_333333_size_42),
                    ))
              ],
            ),
          );
        }).whenComplete(() {
      _searchGoodsViewModel.setPublishTimeCondition();
    });
  }

  _showPriceDialog() {
    _focusNode.unfocus();
    _searchGoodsViewModel.setPriceCondition();
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.DIMENS_20),
                topRight: Radius.circular(AppDimens.DIMENS_20))),
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setHeight(AppDimens.DIMENS_300),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                    child: GestureDetector(
                      onTap: () {
                        _orderType = AppStrings.ASC;
                        _sortName = AppStrings.SORT_RETAIL_PRICE;
                        _onRefresh();
                        Navigator.pop(context);
                      },
                      child: Text(AppStrings.PRICE_ASC,
                          style: FMTextStyle.color_333333_size_42),
                    )),
                Container(
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                    child: GestureDetector(
                      onTap: () {
                        _orderType = AppStrings.DESC;
                        _sortName = AppStrings.SORT_RETAIL_PRICE;
                        _onRefresh();
                        Navigator.pop(context);
                      },
                      child: Text(AppStrings.PRICE_DESC,
                          style: FMTextStyle.color_333333_size_42),
                    ))
              ],
            ),
          );
        }).whenComplete(() {
      _searchGoodsViewModel.setPriceCondition();
    });
  }

  Widget _goodsWidget() {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        itemCount: _searchGoodsViewModel.goods.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemBuilder: (BuildContext context, int index) {
          return GoodsWidget(
              _searchGoodsViewModel.goods[index], (value) {});
        });
  }

  _onRefresh()  {
    _pageIndex = 1;
    _searchGoodsViewModel.searchGoods(_keyController.text.toString(),
        _pageIndex, _pageSize, _sortName, _orderType);
  }

  _onLoadMore() async {
    _searchGoodsViewModel.searchGoods(_keyController.text.toString(),
        _pageIndex, _pageSize, _sortName, _orderType);
  }

  _sort() {
    _focusNode.unfocus();
    _pageIndex = 1;
    _showDialog(context);
    _searchGoodsViewModel
        .searchGoods(_keyController.text.toString(), _pageIndex, _pageSize,
            _sortName, _orderType)
        .then((value) => Navigator.pop(context));
  }
}

