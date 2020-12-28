import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/collection_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/collect_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CollectPage extends StatefulWidget {
  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  CollectViewModel _collectViewModel = CollectViewModel();
  RefreshController _refreshController = RefreshController();
  int _pageIndex = 1;
  int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _collectViewModel.queryData(_pageIndex, _pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.MINE_COLLECT),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider.value(
          value: _collectViewModel,
          child: Consumer<CollectViewModel>(builder: (context, model, child) {
            _pageIndex = model.canLoadMore ? ++_pageIndex : _pageIndex;
            RefreshStateUtil.getInstance()
                .stopRefreshOrLoadMore(_refreshController);
            return _initView(model);
          }),
        ));
  }

  Widget _initView(CollectViewModel collectViewModel) {
    if (_collectViewModel.pageState == PageState.hasData) {
      return _contentView(collectViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        collectViewModel, _onRefresh);
  }

  Widget _contentView(CollectViewModel collectViewModel) {
    return Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        child: SmartRefresher(
          enablePullDown: true,
          onRefresh: () => _onRefresh(),
          onLoading: () => _onLoadMores(),
          enablePullUp: collectViewModel.canLoadMore,
          header: WaterDropMaterialHeader(
            backgroundColor: AppColors.COLOR_FF5722,
          ),
          controller: _refreshController,
          child: GridView.builder(
              itemCount: collectViewModel.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return getGoodsItemView(collectViewModel.data[index], index);
              }),
        ));
  }

  Widget getGoodsItemView(CollectionList collect, int index) {
    return GestureDetector(
      child: Card(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                CachedImageView(
                  ScreenUtil().setHeight(AppDimens.DIMENS_400),
                  ScreenUtil().setHeight(AppDimens.DIMENS_400),
                  collect.picUrl,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_20),
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                  child: Text(
                    collect.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FMTextStyle.color_333333_size_42,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                Text(
                  "${AppStrings.DOLLAR}${collect.retailPrice}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FMTextStyle.color_ff5722_size_42,
                ),
              ],
            )),
      ),
      onTap: () => _itemClick(collect.valueId),
      onLongPress: () => _showDeleteDialog(collect, index),
    );
  }

  _itemClick(int goodsId) {
    NavigatorUtil.goGoodsDetails(context, goodsId);
  }

  _showDeleteDialog(CollectionList collect, int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppStrings.TIPS,
              style: FMTextStyle.color_333333_size_48,
            ),
            content: Text(
              AppStrings.MINE_CANCEL_COLLECT,
              style: FMTextStyle.color_333333_size_42,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.CANCEL,
                    style: FMTextStyle.color_999999_size_42,
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //_cancelCollect(collect.valueId, index);
                  },
                  child: Text(
                    AppStrings.CONFIRM,
                    style: FMTextStyle.color_ff5722_size_42,
                  )),
            ],
          );
        });
  }

  _onRefresh() {
    _pageIndex = 1;
    _collectViewModel.queryData(_pageIndex, _pageSize);
  }

  _onLoadMores() {
    _collectViewModel.queryData(_pageIndex, _pageSize);
  }
}
