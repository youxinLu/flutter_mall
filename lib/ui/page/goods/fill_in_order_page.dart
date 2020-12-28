import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/fill_in_order_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/ui/widgets/divider_line.dart';
import 'package:mall/ui/widgets/item_text.dart';
import 'package:mall/ui/widgets/right_arrow.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/fill_in_order_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FillInOrderPage extends StatefulWidget {
  final int cartId;

  FillInOrderPage(this.cartId);

  @override
  _FillInOrderPageState createState() => _FillInOrderPageState();
}

class _FillInOrderPageState extends State<FillInOrderPage> {
  FillInOrderViewModel _fillInOrderViewModel = FillInOrderViewModel();
  TextEditingController _remarkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fillInOrderViewModel.queryFillInOrderData(widget.cartId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FillInOrderViewModel>(
      create: (context) => _fillInOrderViewModel,
      child: Selector<FillInOrderViewModel, FillInOrderEntity>(
          selector: (BuildContext context, FillInOrderViewModel model) {
        return model.fillInOrderEntity;
      }, builder: (context, data, child) {
        return showWidget(_fillInOrderViewModel);
      }),
    );
  }

  Widget showWidget(FillInOrderViewModel fillInOrderViewModel) {
    if (fillInOrderViewModel.pageState == PageState.hasData) {
      return _dataView(fillInOrderViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        fillInOrderViewModel, (){});
  }

  Widget _dataView(FillInOrderViewModel model) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.FILL_IN_ORDER),
          centerTitle: true,
        ),
        body: _contentView(model),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          margin:
              EdgeInsets.only(left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
          height: ScreenUtil().setHeight(AppDimens.DIMENS_150),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                      "${AppStrings.ACTUAL_PAY}${model.fillInOrderEntity.orderTotalPrice}",style: FMTextStyle.color_333333_size_42,)),
             Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(AppDimens.DIMENS_300),
                  height: double.infinity,
                  child: RaisedButton(
                    color: AppColors.COLOR_FF5722,
                    onPressed:() => _submitOrder(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppDimens.DIMENS_30))),
                    child: Text(
                      AppStrings.PAY,
                      style: FMTextStyle.color_ffffff_size_42,
                    ),
                  ),
                ),
            ],
          ),
        )));
  }

  Widget _contentView(FillInOrderViewModel model) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _addressWidget(model),
            DividerLineView(height: AppDimens.DIMENS_20),
            Column(
              children: _goodsItems(model.fillInOrderEntity.checkedGoodsList),
            ),
            DividerLineView(height: AppDimens.DIMENS_20),
            _remarkWidget(),
            DividerLineView(height: AppDimens.DIMENS_20),
            _couponWidget(model),
            DividerLineView(),
            ItemTextView(AppStrings.GOODS_TOTAL,
                "${AppStrings.DOLLAR}${model.fillInOrderEntity.goodsTotalPrice}"),
            DividerLineView(),
            ItemTextView(AppStrings.FREIGHT,
                "${AppStrings.DOLLAR}${model.fillInOrderEntity.freightPrice}"),
            DividerLineView(),
            ItemTextView(AppStrings.COUPON_TOTAL,
                "${AppStrings.DOLLAR}${model.fillInOrderEntity.couponPrice}"),
          ],
        ),
      ),
    );
  }

  List<Widget> _goodsItems(List<FillInOrderCheckedgoodslist> goods) {
    List<Widget> widgets = List();
    for (int i = 0; i < goods.length; i++) {
      widgets.add(_goodsItem(goods[i]));
      if (i != goods.length - 1) {
        widgets.add(DividerLineView());
      }
    }
    return widgets;
  }

  Widget _goodsItem(FillInOrderCheckedgoodslist checkedGoods) {
    return Container(
      color: AppColors.COLOR_FFFFFF,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          top: ScreenUtil().setHeight(AppDimens.DIMENS_20),
          bottom: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CachedImageView(ScreenUtil().setWidth(AppDimens.DIMENS_240),
              ScreenUtil().setWidth(AppDimens.DIMENS_240), checkedGoods.picUrl),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                checkedGoods.goodsName,
                style: FMTextStyle.color_333333_size_42,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_10))),
              Text(
                checkedGoods.specifications[0],
                style:  FMTextStyle.color_999999_size_42,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
              Text(
                "${AppStrings.DOLLAR}${checkedGoods.price}",
                style: FMTextStyle.color_ff5722_size_42,
              )
            ],
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Text("${AppStrings.GOODS_NUMBER}${checkedGoods.number}"),
          ))
        ],
      ),
    );
  }

  //地址
  Widget _addressWidget(FillInOrderViewModel model) {
    return ChangeNotifierProvider.value(
      value: _fillInOrderViewModel,
      child: Selector<FillInOrderViewModel, FillInOrderCheckedaddress>(builder:
          (context, data, child) {
        return Container(
          color: AppColors.COLOR_FFFFFF,
          height: ScreenUtil().setHeight(AppDimens.DIMENS_240),
          padding: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
          margin: EdgeInsets.all(0),
          child: model.fillInOrderCheckAddress.id != 0
              ? InkWell(
                  onTap: () {
                    NavigatorUtil.goAddress(context, 1)
                        .then((value) => model.updateAddress(value));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                model.fillInOrderCheckAddress.name,
                                style:FMTextStyle.color_333333_size_42
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil()
                                        .setHeight(AppDimens.DIMENS_30)),
                              ),
                              Text(
                                model.fillInOrderCheckAddress.tel,
                                style: FMTextStyle.color_333333_size_42
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil()
                                    .setHeight(AppDimens.DIMENS_20)),
                          ),
                          Text(
                            model.fillInOrderCheckAddress.province +
                                model.fillInOrderCheckAddress.city +
                                model.fillInOrderCheckAddress.county +
                                model.fillInOrderCheckAddress.addressDetail,
                            style: FMTextStyle.color_333333_size_42
                          ),
                        ],
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: RightArrow()))
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    NavigatorUtil.goAddress(context, 1).then((value) {
                      model.updateAddress(value);
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppStrings.PLEASE_SELECT_ADDRESS,
                        style: FMTextStyle.color_999999_size_42
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: RightArrow()))
                    ],
                  ),
                ),
        );
      }, selector:
          (BuildContext context, FillInOrderViewModel fillInOrderViewModel) {
        return fillInOrderViewModel.fillInOrderCheckAddress;
      }),
    );
  }

  //优惠券
  Widget _couponWidget(FillInOrderViewModel model) {
    return Container(
      color: AppColors.COLOR_FFFFFF,
      width: double.infinity,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
      child: Row(
        children: <Widget>[
          Image.asset(
            AppImages.COUPON,
            width: ScreenUtil().setWidth(AppDimens.DIMENS_120),
            height: ScreenUtil().setHeight(AppDimens.DIMENS_60),
          ),
          Text(
            AppStrings.COUPON,
            style: FMTextStyle.color_333333_size_42
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                model.fillInOrderEntity.availableCouponLength == 0
                    ? Text(
                        AppStrings.NOT_AVAILABLE_COUPON,
                        style: FMTextStyle.color_999999_size_42
                      )
                    : Text(
                        "${model.fillInOrderEntity.couponPrice}${AppStrings.MONEY_UNIT}",
                        style: FMTextStyle.color_333333_size_42
                      ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                ),
                RightArrow()
              ],
            ),
          ))
        ],
      ),
    );
  }

  //备注
  Widget _remarkWidget() {
    return Container(
      color: AppColors.COLOR_FFFFFF,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_180),
      width: double.infinity,
      padding: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppStrings.REMARK,
            style: FMTextStyle.color_333333_size_42
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(AppDimens.DIMENS_60)),
            height: double.infinity,
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: AppStrings.REMARK_HINT,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle:FMTextStyle.color_999999_size_42,
                hasFloatingPlaceholder: false,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: ScreenUtil().setHeight(AppDimens.DIMENS_1))),
              ),
              style: FMTextStyle.color_333333_size_42,
              controller: _remarkController,
            ),
          ))
        ],
      ),
    );
  }

  _submitOrder() {
    if (_fillInOrderViewModel.fillInOrderCheckAddress.id == 0) {
      ToastUtil.showToast(AppStrings.PLEASE_SELECT_ADDRESS);
      return;
    }
    _fillInOrderViewModel
        .submitOrder(
            _fillInOrderViewModel.fillInOrderEntity.cartId,
            _fillInOrderViewModel.fillInOrderCheckAddress.id,
            _remarkController.value.toString(),
            _fillInOrderViewModel.fillInOrderEntity.couponId)
        .then((value) {
      if (value) {
        //https://www.jianshu.com/p/9d858596a30a
        /* Navigator.of(context).popUntil(
              (route) => route.settings.name.startsWith(Routers.goodsDetail));
        Navigator.pop(context);*/
        NavigatorUtil.goSubmitSuccess(context);
      }
    });
  }

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }
}
