import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/coupon_entity.dart';
import 'package:mall/ui/widgets/empty_data.dart';
import 'package:mall/ui/widgets/loading_dialog.dart';
import 'package:mall/ui/widgets/network_error.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/coupon_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  CouponViewModel _couponViewModel = CouponViewModel();
  RefreshController _refreshController = RefreshController();
  int _pageIndex = 1;
  int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _couponViewModel.queryCoupon(_pageIndex, _pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.MINE_COUPON),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => _couponViewModel,
        child: Consumer<CouponViewModel>(builder: (context, model, child) {
          _pageIndex = model.canLoadMore ? ++_pageIndex : _pageIndex;
          RefreshStateUtil.getInstance()
              .stopRefreshOrLoadMore(_refreshController);
          return _initView(model);
        }),
      ),
    );
  }

  Widget _initView(CouponViewModel couponViewModel) {
    if (couponViewModel.pageState == PageState.hasData) {
      return _contentView(couponViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        couponViewModel, _onRefresh);
  }

  void _onRefresh() {
    _pageIndex = 1;
    _couponViewModel.queryCoupon(_pageIndex, _pageSize);
  }

  void _onLoadMore() {
    _couponViewModel.queryCoupon(_pageIndex, _pageSize);
  }

  Widget _contentView(CouponViewModel addressViewModel) {
    return Container(
      child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: addressViewModel.canLoadMore,
          header: WaterDropMaterialHeader(
            backgroundColor: AppColors.COLOR_FF5722,
          ),
          controller: _refreshController,
          onLoading: () => _onLoadMore(),
          onRefresh: () => _onRefresh(),
          child: ListView.builder(
              itemCount: addressViewModel.coupons.length,
              itemBuilder: (BuildContext context, int index) {
                return _couponItemView(addressViewModel.coupons[index]);
              })),
    );
  }

  Widget _couponItemView(CouponList coupon) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
      height: ScreenUtil().setHeight(AppDimens.DIMENS_270),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.BG_COUPON), fit: BoxFit.fill)),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(AppDimens.DIMENS_240),
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(AppDimens.DIMENS_60),
                right: ScreenUtil().setWidth(AppDimens.DIMENS_60)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  AppStrings.DOLLAR,
                  style: FMTextStyle.color_ff5722_size_42,
                ),
                Text(
                  "${coupon.discount}",
                  style: FMTextStyle.color_ff5722_size_80,
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coupon.name + coupon.desc,
                  style: FMTextStyle.color_333333_size_42,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                Text(
                  AppStrings.FULL + "${coupon.min}" + AppStrings.USE,
                  style: FMTextStyle.color_333333_size_42,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                Text(
                  transformDate(coupon.startTime) +
                      "-" +
                      transformDate(coupon.endTime),
                  style: FMTextStyle.color_333333_size_42,
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }

  String transformDate(String time) {
    var data = DateTime.parse(time);
    return DateUtil.formatDate(data, format: DateFormats.y_mo_d);
  }
}
