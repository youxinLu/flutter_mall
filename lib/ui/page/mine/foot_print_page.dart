import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/foot_print_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/footprint_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FootPrintPage extends StatefulWidget {
  @override
  _FootPrintPageState createState() => _FootPrintPageState();
}

class _FootPrintPageState extends State<FootPrintPage> {
  var _pageIndex = 1;
  var _pageSize = 10;
  FootPrintViewModel _footPrintViewModel = FootPrintViewModel();
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _footPrintViewModel.queryFootPrint(_pageIndex, _pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FootPrintViewModel>(
      create: (_) => _footPrintViewModel,
      child: Consumer<FootPrintViewModel>(builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
                title: Text(AppStrings.MINE_FOOTPRINT),
                centerTitle: true,
                actions: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                    child: InkWell(
                      onTap: () => _footPrintViewModel
                          .setShowCheckBox(!_footPrintViewModel.isShowCheckBox),
                      child: Text(
                        _footPrintViewModel.isShowCheckBox
                            ? AppStrings.CANCEL
                            : AppStrings.SELECT,
                        style: FMTextStyle.color_ffffff_size_42,
                      ),
                    ),
                  )
                ]),
            body: _initView(model),
            bottomNavigationBar: Visibility(
              visible: _footPrintViewModel.isShowCheckBox &&
                  _footPrintViewModel.goods.length > 0,
              child: Container(
                padding: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                    right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                height: ScreenUtil().setHeight(AppDimens.DIMENS_150),
                child: RaisedButton(
                  color: AppColors.COLOR_FF5722,
                  onPressed: () => _deleteFootPrint(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    AppStrings.DELETE,
                    style: FMTextStyle.color_ffffff_size_48,
                  ),
                ),
              ),
            ));
      }),
    );
  }

  Widget _initView(FootPrintViewModel footPrintViewModel) {
    _pageIndex = footPrintViewModel.canLoadMore ? ++_pageIndex : _pageIndex;
    RefreshStateUtil.getInstance().stopRefreshOrLoadMore(_refreshController);
    if (footPrintViewModel.pageState == PageState.hasData) {
      return _contentView(footPrintViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        footPrintViewModel, _onRefresh);
  }

  Widget _contentView(FootPrintViewModel footPrintViewModel) {
    return Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: footPrintViewModel.canLoadMore,
          header: WaterDropMaterialHeader(
            backgroundColor: AppColors.COLOR_FF5722,
          ),
          controller: _refreshController,
          onRefresh: () => _onRefresh(),
          onLoading: () => _onLoadMore(),
          child: GridView.builder(
              itemCount: footPrintViewModel.goods.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return getGoodsItemView(footPrintViewModel.goods[index], index);
              }),
        ));
  }

  Widget getGoodsItemView(FootPrintGoodsEntity goods, int index) {
    return GestureDetector(
      child: Card(
          child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  CachedImageView(
                    ScreenUtil().setHeight(AppDimens.DIMENS_400),
                    ScreenUtil().setHeight(AppDimens.DIMENS_400),
                    goods.picUrl,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_20),
                        left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                        right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                    child: Text(goods.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FMTextStyle.color_333333_size_42),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                  Text(
                    "${AppStrings.DOLLAR}${goods.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FMTextStyle.color_ff5722_size_42,
                  ),
                ],
              )),
          Positioned(
            top: 0,
            right: 0,
            child: Offstage(
                offstage: !_footPrintViewModel.isShowCheckBox,
                child: Checkbox(
                    hoverColor: AppColors.COLOR_999999,
                    value: goods.isCheck,
                    onChanged: (isCheck) {
                      _footPrintViewModel.setCheck(index, isCheck);
                    })),
          )
        ],
      )),
      onTap: () => _itemClick(goods.goodsId),
    );
  }

  _onRefresh() {
    _pageIndex = 1;
    _footPrintViewModel.queryFootPrint(_pageIndex, _pageSize);
  }

  _onLoadMore() {
    _footPrintViewModel.queryFootPrint(_pageIndex, _pageSize);
  }

  _itemClick(int goodsId) {
    NavigatorUtil.goGoodsDetails(context, goodsId);
  }

  _deleteFootPrint() {
    List ids = List();
    for (FootPrintGoodsEntity footPrintGoodsEntity
        in _footPrintViewModel.goods) {
      if (footPrintGoodsEntity.isCheck) {
        ids.add(footPrintGoodsEntity.id);
      }
    }
    if (ids.length == 0) {
      ToastUtil.showToast(AppStrings.PLEASE_SELECT_FOOT_PRINT);
      return;
    }
    _footPrintViewModel.deleteFootPrint(ids).then((response) {
      if (response) {
        ToastUtil.showToast(AppStrings.DELETE_SUCCESS);
      } else {
        ToastUtil.showToast(AppStrings.DELETE_FOOT_PRINT_FAIL);
      }
      _footPrintViewModel.setShowCheckBox(false);
      _onRefresh();
    });
  }
}
