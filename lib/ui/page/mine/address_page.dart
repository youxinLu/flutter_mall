import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/address_entity.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/address_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddressViewPage extends StatefulWidget {
  final int type;

  AddressViewPage(this.type);

  @override
  _AddressViewPageState createState() => _AddressViewPageState();
}

class _AddressViewPageState extends State<AddressViewPage> {
  AddressViewModel _addressViewModel = AddressViewModel();
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _addressViewModel.queryAddressData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.MY_ADDRESS),
          centerTitle: true,
          actions: <Widget>[
            InkWell(
                child: Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10.0)),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => _goAddressEdit(0),
                child: Text(AppStrings.ADD_ADDRESS),
              ),
            ))
          ],
        ),
        body: ChangeNotifierProvider<AddressViewModel>(
            create: (context) => _addressViewModel,
            child: Consumer<AddressViewModel>(builder: (context, model, child) {
              RefreshStateUtil.getInstance()
                  .stopRefreshOrLoadMore(_refreshController);
              return SmartRefresher(
                  header: WaterDropMaterialHeader(
                    backgroundColor: AppColors.COLOR_FF5722,
                  ),
                  controller: _refreshController,
                  onRefresh: () => _onRefresh(),
                  child: _initView(model));
            })));
  }

  void _onRefresh() {
    _addressViewModel.queryAddressData();
  }

  Widget _initView(AddressViewModel addressViewModel) {
    if (addressViewModel.pageState == PageState.hasData) {
      return _contentView(addressViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        addressViewModel, _onRefresh);
  }

  Widget _contentView(AddressViewModel addressViewModel) {
    return ListView.builder(
        itemCount: addressViewModel.address.length,
        itemBuilder: (BuildContext context, int index) {
          return _addressItemView(addressViewModel.address[index]);
        });
  }

  Widget _addressItemView(AddressList addressData) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
      child: Card(
          child: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
            bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
        child: InkWell(
          highlightColor: AppColors.COLOR_FFFFFF,
          splashColor: AppColors.COLOR_FFFFFF,
          onTap: () => _goFillInOrder(addressData),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                    right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(AppDimens.DIMENS_60)),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    width: ScreenUtil().setWidth(AppDimens.DIMENS_120),
                    height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                    child: Text(
                      addressData.name.substring(0, 1),
                      style: FMTextStyle.color_ffffff_size_60
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        addressData.name,
                        style: FMTextStyle.color_333333_size_42,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left:
                                  ScreenUtil().setWidth(AppDimens.DIMENS_20))),
                      Text(
                        addressData.tel,
                        style: FMTextStyle.color_999999_size_42,
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(AppDimens.DIMENS_20))),
                  Text(
                    addressData.province +
                        addressData.city +
                        addressData.county +
                        addressData.addressDetail,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // 显示不完，就在后面显示点点
                    style:  FMTextStyle.color_333333_size_42,
                  )
                ],
              )),
              InkWell(
                  highlightColor: AppColors.COLOR_FFFFFF,
                  splashColor: AppColors.COLOR_FFFFFF,
                  onTap: () => _goAddressEdit(addressData.id),
                  child: Container(
                    width: ScreenUtil().setWidth(AppDimens.DIMENS_180),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        shape: Border(
                            left: BorderSide(
                                color: AppColors.COLOR_999999,
                                width: ScreenUtil()
                                    .setWidth(AppDimens.DIMENS_1)))),
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                    child: Text(
                      AppStrings.ADDRESS_EDIT,
                      style:  FMTextStyle.color_999999_size_42,
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }

  _goFillInOrder(AddressList addressData) {
    if (widget.type == 1) {
      Navigator.pop(context, Uri.encodeFull(jsonEncode(addressData)));
    }
  }

  _goAddressEdit(var addressId) {
    NavigatorUtil.goAddressEdit(context, addressId).then((bool) {
      _addressViewModel.queryAddressData();
    });
  }
}
