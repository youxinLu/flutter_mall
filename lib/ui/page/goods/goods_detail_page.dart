import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/ui/page/goods/goods_detail_swiper.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/ui/widgets/cart_number.dart';
import 'package:mall/ui/widgets/divider_line.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/cart_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:mall/view_model/user_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:mall/view_model/goods_detail_view_model.dart';
import 'package:mall/model/goods_detail_entity.dart';

class GoodsDetailPage extends StatefulWidget {
  final int _goodsId;

  GoodsDetailPage(this._goodsId);

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  var _goodsId;
  GoodsDetailViewModel _goodsDetailViewModel = GoodsDetailViewModel();
  CartViewModel _cartViewModel;
  var _specificationIndex = 0;
  int _number = 1;

  @override
  void initState() {
    super.initState();
    _goodsId = widget._goodsId;
    _goodsDetailViewModel.getGoodsDetail(_goodsId);
    Future.delayed(Duration(milliseconds: 3000)).then((value) =>
        Provider.of<UserViewModel>(context, listen: false)
            .collectionDataChange());
  }

  @override
  Widget build(BuildContext context) {
    _cartViewModel = Provider.of<CartViewModel>(context);
    return ChangeNotifierProvider<GoodsDetailViewModel>(
      create: (context) => _goodsDetailViewModel,
      child: Selector<GoodsDetailViewModel, GoodsDetailEntity>(
        builder: (BuildContext context, GoodsDetailEntity goodsDetailEntity,
            Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.GOODS_DETAIL),
              centerTitle: true,
            ),
            body: showWidget(_goodsDetailViewModel),
            bottomNavigationBar: Selector<GoodsDetailViewModel, bool>(
                builder: (BuildContext context, bool data, Widget child) {
              return bottomView(data);
            }, selector: (BuildContext context, GoodsDetailViewModel model) {
              return model.isCollection;
            }),
          );
        },
        selector: (BuildContext context, GoodsDetailViewModel model) {
          return model.goodsDetailEntity;
        },
      ),
    );
  }

  Widget bottomView(bool isCollection) {
    return BottomAppBar(
      child: Container(
        height: ScreenUtil().setHeight(AppDimens.DIMENS_150),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () => _collection(),
                    child: Icon(
                      Icons.star_border,
                      color: _goodsDetailViewModel.isCollection
                          ? AppColors.COLOR_FF5722
                          : AppColors.COLOR_999999,
                      size: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: AppColors.COLOR_FF5722,
                      size: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                  child: FlatButton(
                    padding: EdgeInsets.all(AppDimens.DIMENS_10),
                    color: AppColors.COLOR_FF5722,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppDimens.DIMENS_30))),
                    onPressed: () => openBottomSheet(
                        context, _goodsDetailViewModel.goodsDetailEntity, 1),
                    child: Text(AppStrings.ADD_CART,
                        style: FMTextStyle.color_ffffff_size_42),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_40))),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(
                        right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                    child: FlatButton(
                      padding: EdgeInsets.all(AppDimens.DIMENS_10),
                      color: AppColors.COLOR_FFB24E,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppDimens.DIMENS_30))),
                      onPressed: () => openBottomSheet(
                          context, _goodsDetailViewModel.goodsDetailEntity, 2),
                      child: Text(AppStrings.BUY,
                          style: FMTextStyle.color_ffffff_size_42),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget showWidget(GoodsDetailViewModel categoryGoodsViewModel) {
    if (categoryGoodsViewModel.pageState == PageState.hasData) {
      return _dataView(categoryGoodsViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(categoryGoodsViewModel,
        () => _goodsDetailViewModel.getGoodsDetail(_goodsId));
  }

  Widget _dataView(GoodsDetailViewModel goodsDetailViewModel) {
    return Container(
        color: AppColors.COLOR_FFFFFF,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            GoodsDetailSwiper(_goodsDetailViewModel.goodsDetailEntity),
            DividerLineView(
              height: AppDimens.DIMENS_6,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(goodsDetailViewModel.goodsDetailEntity.info.name,
                      style: FMTextStyle.color_333333_size_42_bold),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
                  ),
                  Text(goodsDetailViewModel.goodsDetailEntity.info.brief,
                      style: FMTextStyle.color_999999_size_36),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_10)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                          "${AppStrings.ORIGINAL_PRICE}：${goodsDetailViewModel.goodsDetailEntity.info.counterPrice}",
                          style: FMTextStyle.color_999999_size_36_lineThrough),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                      ),
                      Text(
                          "${AppStrings.CURRENT_PRICE}：${goodsDetailViewModel.goodsDetailEntity.info.retailPrice}",
                          style: FMTextStyle.color_ff5722_size_42),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_10)),
            ),
            goodsDetailViewModel.goodsDetailEntity.attribute == null ||
                    goodsDetailViewModel.goodsDetailEntity.attribute.length == 0
                ? Divider()
                : Container(
                    color: AppColors.COLOR_FFFFFF,
                    child: Column(
                      children: <Widget>[
                        Text(AppStrings.COMMODITY_PARAMETERS,
                            style: FMTextStyle.color_333333_size_42_bold),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                        ),
                        _attributeView(goodsDetailViewModel.goodsDetailEntity),
                      ],
                    ),
                  ),
            Html(data: goodsDetailViewModel.goodsDetailEntity.info.detail),
            goodsDetailViewModel.goodsDetailEntity.issue == null ||
                    goodsDetailViewModel.goodsDetailEntity.issue.length == 0
                ? Divider()
                : Container(
                    child: Column(
                      children: <Widget>[
                        Text(AppStrings.COMMON_PROBLEM,
                            style: FMTextStyle.color_333333_size_42_bold),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
                        ),
                        _issueView(goodsDetailViewModel.goodsDetailEntity),
                      ],
                    ),
                  ),
          ],
        )));
  }

  //商品属性Widget
  Widget _attributeView(GoodsDetailEntity goodsDetail) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: goodsDetail.attribute.length,
        itemBuilder: (BuildContext context, int index) {
          return _attributeItemView(goodsDetail.attribute[index]);
        });
  }

  Widget _attributeItemView(GoodsDetailAttribute attribute) {
    return Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        decoration: BoxDecoration(
            color: AppColors.COLOR_F9F9F9,
            borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(AppDimens.DIMENS_20))),
        padding: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_20)),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(attribute.attribute,
                  style: FMTextStyle.color_333333_size_42),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    attribute.value,
                    style: FMTextStyle.color_999999_size_42,
                  ),
                )),
          ],
        ));
  }

  //常见问题
  Widget _issueView(GoodsDetailEntity goodsDetail) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: goodsDetail.issue.length,
        itemBuilder: (BuildContext context, int index) {
          return _issueItemView(goodsDetail.issue[index]);
        });
  }

  Widget _issueItemView(GoodsDetailIssue issue) {
    return Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        padding: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(issue.question, style: FMTextStyle.color_333333_size_42),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(issue.answer,
                    style: FMTextStyle.color_999999_size_42)),
          ],
        ));
  }

  openBottomSheet(
      BuildContext context, GoodsDetailEntity goodsDetailEntity, int showType) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            height: ScreenUtil().setHeight(AppDimens.DIMENS_850),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(
                        ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CachedImageView(
                            ScreenUtil().setWidth(AppDimens.DIMENS_180),
                            ScreenUtil().setWidth(AppDimens.DIMENS_180),
                            _goodsDetailViewModel
                                .goodsDetailEntity.info.gallery[0]),
                        Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil()
                                    .setWidth(AppDimens.DIMENS_20))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                AppStrings.PRICE +
                                    "：" +
                                    "${goodsDetailEntity.info.retailPrice}",
                                style: FMTextStyle.color_333333_size_42),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil()
                                      .setHeight(AppDimens.DIMENS_20)),
                            ),
                            Text(
                                AppStrings.ALREAD_SELECTED +
                                    _goodsDetailViewModel
                                        .goodsDetailEntity
                                        .productList[0]
                                        .specifications[_specificationIndex],
                                style: FMTextStyle.color_333333_size_42),
                          ],
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Image.asset(
                                    AppImages.CLOSE,
                                    width: ScreenUtil()
                                        .setWidth(AppDimens.DIMENS_60),
                                    height: ScreenUtil()
                                        .setWidth(AppDimens.DIMENS_60),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                    child: Text(AppStrings.SPECIFICATIONS,
                        style: FMTextStyle.color_333333_size_42),
                  ),
                  ChangeNotifierProvider.value(
                    value: _goodsDetailViewModel,
                    child: Selector<GoodsDetailViewModel, int>(builder:
                        (BuildContext context, int data, Widget child) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                        child: Wrap(
                            spacing: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                            children: _specificationsWidget(
                                goodsDetailEntity.specificationList, data)),
                      );
                    }, selector:
                        (BuildContext context, GoodsDetailViewModel model) {
                      return model.specificationId;
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
                  ),
                  Container(
                      margin: EdgeInsets.all(
                          ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                      child: Row(
                        children: [
                          Text(AppStrings.NUMBER,
                              style: FMTextStyle.color_333333_size_42),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(
                                  ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                              alignment: Alignment.centerRight,
                              child: CartNumberView(1, (number) {
                                _number = number;
                                print(number);
                              }),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                        left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                        right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                    child: SizedBox(
                      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                      width: double.infinity,
                      child: RaisedButton(
                        color: showType == 1
                            ? AppColors.COLOR_FF5722
                            : AppColors.COLOR_FFB24E,
                        onPressed: () => showType == 1 ? _addCart() : _buy(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppDimens.DIMENS_30))),
                        child: Text(
                            showType == 1
                                ? AppStrings.ADD_CART
                                : AppStrings.BUY,
                            style: FMTextStyle.color_ffffff_size_42),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _addCart() {
    SharedPreferencesUtil.getInstance()
        .getString(AppStrings.TOKEN)
        .then((value) {
      if (value != null) {
        _cartViewModel
            .addCart(_goodsDetailViewModel.goodsDetailEntity.info.id,
                _goodsDetailViewModel.specificationId, _number)
            .then((response) {
          if (response) {
            Navigator.of(context).pop(); //隐藏弹出框
          }
        });
      } else {
        NavigatorUtil.goLogin(context);
      }
    });
  }

  _buy() {
    SharedPreferencesUtil.getInstance()
        .getString(AppStrings.TOKEN)
        .then((value) {
      if (value != null) {
        _goodsDetailViewModel
            .buy(_goodsDetailViewModel.goodsDetailEntity.info.id,
                _goodsDetailViewModel.specificationId, _number)
            .then((response) {
          if (response > 0) {
            Navigator.of(context).pop(); //隐藏弹出框
            NavigatorUtil.goFillInOrder(context, response);
          } else {
            ToastUtil.showToast(_cartViewModel.errorMessage);
          }
        });
      } else {
        NavigatorUtil.goLogin(context);
      }
    });
  }

  _collection() {
    SharedPreferencesUtil.getInstance()
        .getString(AppStrings.TOKEN)
        .then((value) {
      if (value == null) {
        NavigatorUtil.goLogin(context);
      } else {
        _goodsDetailViewModel.addOrDeleteCollect(_goodsId).then((response) =>
            Provider.of<UserViewModel>(context, listen: false)
                .collectionDataChange());
      }
    });
  }

  List<Widget> _specificationsWidget(
      List<GoodsDetailSpecificationlist> specifications, int specificationId) {
    List<Widget> specificationsWidget = List();
    specifications.forEach((element) {
      specificationsWidget.add(Container(
        child: ChoiceChip(
          label: Text(element.name,
              style: specificationId == element.valueList[0].id
                  ? FMTextStyle.color_ffffff_size_36
                  : FMTextStyle.color_333333_size_42),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(ScreenUtil().setWidth(AppDimens.DIMENS_60))),
              side: BorderSide(
                color: specificationId == element.valueList[0].id
                    ? AppColors.COLOR_FF5722
                    : AppColors.COLOR_999999,
                width: ScreenUtil().setWidth(AppDimens.DIMENS_1),
              )),
          backgroundColor: AppColors.COLOR_FFFFFF,
          selectedColor: AppColors.COLOR_FF5722,
          selected: specificationId == element.valueList[0].id,
          onSelected: (value) => {
            if (value)
              {
                _goodsDetailViewModel
                    .setSpecificationId(element.valueList[0].id)
              }
          },
        ),
      ));
    });
    return specificationsWidget;
  }
}
