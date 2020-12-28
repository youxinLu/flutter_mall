import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/cart_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/ui/widgets/cart_number.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/cart_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

class TabCartPage extends StatefulWidget {
  @override
  _TabCartPageState createState() => _TabCartPageState();
}

class _TabCartPageState extends State<TabCartPage> {
  RefreshController _refreshController = RefreshController();
  CartViewModel _cartViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cartViewModel = Provider.of<CartViewModel>(context);
    return Consumer<CartViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.SHOP_CAR),
          centerTitle: true,
        ),
        body: _contentView(model),
        bottomNavigationBar: _bottomWidget(model),
      );
    });
  }

  Widget _bottomWidget(CartViewModel cartViewModel) {
    return cartViewModel.isShowBottomView
        ? Container(
            height: ScreenUtil().setHeight(AppDimens.DIMENS_180),
            decoration: ShapeDecoration(
                shape: Border(
                    top:
                        BorderSide(color: AppColors.COLOR_F0F0F0, width: 1.0))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: cartViewModel.isAllCheck,
                    activeColor: AppColors.COLOR_FF5722,
                    onChanged: (bool) {
//                      _cartViewModel _setCartItemCheck(bool);
                      _setCheckAll(bool);
                    }),
                Container(
                  width: ScreenUtil().setWidth(AppDimens.DIMENS_240),
                  child: Text(AppStrings.TOTAL_MONEY +
                      "${cartViewModel.cartEntity.cartTotal.checkedGoodsAmount}"),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: () {
                      NavigatorUtil.goFillInOrder(context, 0);
                    },
                    color: AppColors.COLOR_FF5722,
                    child: Text(
                      AppStrings.GO_PAY,
                      style: TextStyle(
                          color: AppColors.COLOR_FFFFFF,
                          fontSize: ScreenUtil().setSp(AppDimens.DIMENS_42)),
                    ),
                  ),
                ))
              ],
            ),
          ) : Container(
            height: 0,
          );
  }

  _setCheckAll(bool check) {
    List<int> ids = List();
    for (int i = 0; i < _cartViewModel.cartEntity.cartList.length; i++) {
      if (_cartViewModel.cartEntity.cartList[i].checked != check) {
        ids.add(_cartViewModel.cartEntity.cartList[i].productId);
      }
      _cartViewModel.checkAllCartItem(ids, check);
    }
  }

  Widget _initView(CartViewModel cartViewModel) {
    RefreshStateUtil.getInstance().stopRefreshOrLoadMore(_refreshController);
    if (cartViewModel.pageState == PageState.hasData) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return _cartItemView(cartViewModel.cartEntity.cartList[index], index);
        },
        itemCount: cartViewModel.cartEntity.cartList.length,
      );
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        cartViewModel, _onRefresh);
  }

  Widget _contentView(CartViewModel cartViewModel) {
    return SmartRefresher(
      header: WaterDropMaterialHeader(
        backgroundColor: AppColors.COLOR_FF5722,
      ),
      controller: _refreshController,
      onRefresh: () => _onRefresh(),
      child: _initView(cartViewModel),
    );
  }

  _onRefresh() async {
    await _cartViewModel.queryCart();
  }

  Widget _cartItemView(CartBean cartBean, int index) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
      height: ScreenUtil().setHeight(AppDimens.DIMENS_300),
      width: double.infinity,
      child: Card(
        child: Slidable(
            actionPane: SlidableScrollActionPane(),
            actionExtentRatio: 0.25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: cartBean.checked ?? true,
                    activeColor: AppColors.COLOR_FF5722,
                    hoverColor: AppColors.COLOR_FF5722,
                    onChanged: (bool) {
                      _cartViewModel.checkCartItem(cartBean.productId, bool);
                    }),
                CachedImageView(
                    ScreenUtil().setWidth(AppDimens.DIMENS_200),
                    ScreenUtil().setWidth(AppDimens.DIMENS_200),
                    cartBean.picUrl),
                Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(AppDimens.DIMENS_20))),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(cartBean.goodsName,
                          style: FMTextStyle.color_333333_size_42),
                      Padding(
                          padding: EdgeInsets.only(
                              top:
                                  ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                      Text(
                        "${AppStrings.SPECIFICATIONS}${cartBean.specifications[0]}",
                        style: FMTextStyle.color_999999_size_36,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top:
                                  ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                      Row(
                        children: [
                          Text("${AppStrings.DOLLAR}${cartBean.price}",
                              style: FMTextStyle.color_ff5722_size_42),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(20.0)),
                            alignment: Alignment.centerRight,
                            child: CartNumberView(cartBean.number, (value) {
                              print(value);
                              _cartViewModel.updateCartItem(cartBean.id, value,
                                  cartBean.productId, cartBean.goodsId, index);
                            }),
                          ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: AppStrings.DELETE,
                color: AppColors.COLOR_FF5722,
                icon: Icons.delete,
                closeOnTap: false,
                onTap: () => _deleteDialog(cartBean.productId, index),
              ),
            ]),
      ),
    );
  }

  _deleteDialog(int productId, int index) {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppStrings.TIPS),
            content: Text(AppStrings.DELETE_CART_ITEM_TIPS),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppStrings.CANCEL,
                    style: FMTextStyle.color_999999_size_42),
              ),
              FlatButton(
                onPressed: () {
                  _deleteCartItem(productId, index);
                },
                child: Text(AppStrings.CONFIRM,
                    style: FMTextStyle.color_ff5722_size_42),
              )
            ],
          );
        });
  }

  _deleteCartItem(int productId, int index) {
    _cartViewModel.deleteCartGoods([productId], index).then((response) => {
          if (response) {Navigator.pop(context)}
        });
  }
}
