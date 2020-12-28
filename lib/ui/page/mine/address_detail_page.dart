import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/ui/widgets/divider_line.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/address_detail_view_model.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class AddressDetailPage extends StatefulWidget {
  final addressId;

  AddressDetailPage(this.addressId);

  @override
  _AddressDetailPageState createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressDetailController = TextEditingController();
  AddressDetailViewModel _model = AddressDetailViewModel();
  var _addressId;

  @override
  void initState() {
    super.initState();
    _addressId = widget.addressId;
    _onRefresh();
  }

  _initController(AddressDetailViewModel model) {
    _nameController = TextEditingController(
      text: model.name == null ? "" : model.name,
    );
    _phoneController = TextEditingController(
      text: model.phone == null ? "" : model.phone,
    );
    _addressDetailController = TextEditingController(
      text: model.addressDetail == null ? "" : model.addressDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.ADDRESS_EDIT_TITLE),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider<AddressDetailViewModel>(
          create: (_) => _model,
          child: Consumer<AddressDetailViewModel>(
              builder: (builder, model, child) {
            _initController(model);
            return showWidget(model);
          }),
        ));
  }

  Widget showWidget(AddressDetailViewModel addressDetailViewModel) {
    if (addressDetailViewModel.pageState == PageState.hasData) {
      return _contentView(addressDetailViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        addressDetailViewModel, _onRefresh);
  }

  Widget _contentView(AddressDetailViewModel model) {
    return SafeArea(
        child: Container(
            margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    child: Card(
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _nameWidget(),
                      DividerLineView(),
                      _phoneWidget(),
                      DividerLineView(),
                      _addressAreaWidget(model),
                      DividerLineView(),
                      _addressDetailWidget(),
                    ],
                  ),
                )),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(AppDimens.DIMENS_30))),
                _defaultWidget(model),
                _saveButtonWidget(model),
                _deleteWidget(model)
              ],
            ))));
  }

  Widget _nameWidget() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
      alignment: Alignment.center,
      width: double.infinity,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              child: Text(
                AppStrings.NAME,
                style: FMTextStyle.color_333333_size_42,
              )),
          Positioned(
              left: ScreenUtil().setWidth(AppDimens.DIMENS_200),
              child: Container(
                width: ScreenUtil().setWidth(AppDimens.DIMENS_800),
                child: TextField(
                    maxLines: 1,
                    cursorColor: AppColors.COLOR_FF5722,
                    controller: _nameController,
                    style: FMTextStyle.color_333333_size_42,
                    decoration: InputDecoration(
                      hintText: AppStrings.ADDRESS_PLEASE_INPUT_NAME,
                      hintStyle: FMTextStyle.color_999999_size_42,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    )),
              ))
        ],
      ),
    );
  }

  Widget _phoneWidget() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
      alignment: Alignment.center,
      width: double.infinity,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              child: Text(
                AppStrings.PHONE,
                style: FMTextStyle.color_333333_size_42,
              )),
          Positioned(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_200),
            child: Container(
                width: ScreenUtil().setWidth(AppDimens.DIMENS_800),
                child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    cursorColor: AppColors.COLOR_FF5722,
                    controller: _phoneController,
                    style: FMTextStyle.color_333333_size_42,
                    decoration: InputDecoration(
                      hintText: AppStrings.ADDRESS_PLEASE_INPUT_PHONE,
                      hintStyle: FMTextStyle.color_999999_size_42,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ))),
          )
        ],
      ),
    );
  }

  Widget _addressAreaWidget(AddressDetailViewModel addressDetailViewModel) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
      alignment: Alignment.center,
      width: double.infinity,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              child: Text(
                AppStrings.ADDRESS_AREA,
                style: FMTextStyle.color_333333_size_42,
              )),
          Positioned(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_200),
            child: Container(
                width: ScreenUtil().setWidth(AppDimens.DIMENS_800),
                child: InkWell(
                    onTap: () => this.show(context, addressDetailViewModel),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: ScreenUtil().setHeight(AppDimens.DIMENS_160),
                      child: Text(
                        addressDetailViewModel.addressArea.isEmpty
                            ? AppStrings.ADDRESS_PLEASE_SELECT_CITY
                            : addressDetailViewModel.addressArea,
                        style: addressDetailViewModel.addressArea.isEmpty
                            ? FMTextStyle.color_999999_size_42
                            : FMTextStyle.color_333333_size_42,
                      ),
                    ))),
          )
        ],
      ),
    );
  }

  Widget _addressDetailWidget() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
      alignment: Alignment.center,
      width: double.infinity,
      height: ScreenUtil().setHeight(AppDimens.DIMENS_200),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              child: Text(
                AppStrings.ADDRESS_DETAIL,
                style: FMTextStyle.color_333333_size_42,
              )),
          Positioned(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_200),
            child: Container(
                width: ScreenUtil().setWidth(AppDimens.DIMENS_800),
                height: ScreenUtil().setHeight(AppDimens.DIMENS_200),
                child: TextField(
                    maxLines: 3,
                    controller: _addressDetailController,
                    style: FMTextStyle.color_333333_size_42,
                    cursorColor: AppColors.COLOR_FF5722,
                    decoration: InputDecoration(
                      hintText: AppStrings.ADDRESS_PLEASE_INPUT_DETAIL,
                      hintStyle: FMTextStyle.color_999999_size_42,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ))),
          )
        ],
      ),
    );
  }

  Widget _defaultWidget(AddressDetailViewModel addressDetailViewModel) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
        alignment: Alignment.center,
        width: double.infinity,
        height: ScreenUtil().setHeight(AppDimens.DIMENS_150),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 0,
                child: Text(
                  AppStrings.ADDRESS_SET_DEFAULT,
                  style: FMTextStyle.color_333333_size_42,
                )),
            Positioned(
              right: ScreenUtil().setWidth(AppDimens.DIMENS_20),
              child: Container(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CupertinoSwitch(
                      value: addressDetailViewModel.isDefault,
                      activeColor: AppColors.COLOR_FF5722,
                      onChanged: (bool) {
                        print(bool);
                        addressDetailViewModel.setDefault(
                            bool,
                            _nameController.text,
                            _phoneController.text,
                            _addressDetailController.text);
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _saveButtonWidget(AddressDetailViewModel addressViewModel) {
    return Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(AppDimens.DIMENS_80),
            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        width: double.infinity,
        child: RaisedButton(
          onPressed: () => _submit(addressViewModel),
          color: AppColors.COLOR_FF5722,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.DIMENS_60),
            ),
          ),
          child: Text(
            AppStrings.SAVE,
            style: FMTextStyle.color_ffffff_size_42,
          ),
        ));
  }

  Widget _deleteWidget(AddressDetailViewModel addressDetailViewModel) {
    return Visibility(
      visible: !(_addressId == null || _addressId == 0),
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(AppDimens.DIMENS_40),
            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
        width: double.infinity,
        child: RawMaterialButton(
          onPressed: () => _delete(context, addressDetailViewModel),
          child: Text(
            AppStrings.ADDRESS_DELETE,
            style: FMTextStyle.color_333333_size_42,
          ),
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.DIMENS_60),
              ),
              side: BorderSide(
                  color: AppColors.COLOR_999999,
                  width: ScreenUtil().setWidth(AppDimens.DIMENS_1))),
          fillColor: AppColors.COLOR_FFFFFF,
        ),
      ),
    );
  }

  _onRefresh() {
    _model.queryAddressDetail(_addressId);
  }

  //选择城市
  show(context, addressDetailViewModel) async {
    Result temp = await CityPickers.showCityPicker(
      context: context,
      itemExtent: ScreenUtil().setHeight(AppDimens.DIMENS_120),
      itemBuilder: (item, list, index) {
        return Center(
            child: Text(item,
                maxLines: 1, style: FMTextStyle.color_333333_size_42));
      },
      height: ScreenUtil().setHeight(AppDimens.DIMENS_600),
    );
    addressDetailViewModel.setAddressArea(
        temp.areaId,
        temp.provinceName,
        temp.cityName,
        temp.areaName,
        _nameController.text,
        _phoneController.text,
        _addressDetailController.text);
  }

  //删除地址dialog
  _delete(BuildContext context, AddressDetailViewModel model) {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppStrings.TIPS,
              style: FMTextStyle.color_333333_size_48,
            ),
            content: Text(
              AppStrings.ADDRESS_DELETE_TIPS,
              style: FMTextStyle.color_333333_size_42,
            ),
            actions: <Widget>[
              FlatButton(
                color: AppColors.COLOR_FFFFFF,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppStrings.CANCEL,
                  style: FMTextStyle.color_ff5722_size_42,
                ),
              ),
              FlatButton(
                color: AppColors.COLOR_FFFFFF,
                onPressed: () {
                  Navigator.pop(context);
                  _deleteAddress(model);
                },
                child: Text(
                  AppStrings.CONFIRM,
                  style: FMTextStyle.color_333333_size_42,
                ),
              ),
            ],
          );
        });
  }

  _submit(AddressDetailViewModel model) {
    if (!_judgeAddressBody()) {
      return;
    }
    model
        .saveAddress(
            _addressDetailController.text,
            model.areaId,
            model.cityName,
            model.countryName,
            _addressId.toString(),
            model.isDefault,
            _nameController.text,
            model.provinceName,
            _phoneController.text)
        .then((response) {
      if (response) {
        Navigator.pop(context);
      }
    });
  }

  _deleteAddress(AddressDetailViewModel model) {
    model.deleteAddress(_addressId).then((response) {
      if (response) {
        ToastUtil.showToast(AppStrings.ADDRESS_DELETE_SUCCESS);
        Navigator.pop(context);
      } else {
        ToastUtil.showToast(_model.errorMessage);
      }
    });
  }

  bool _judgeAddressBody() {
    if (_nameController.text.toString().isEmpty) {
      ToastUtil.showToast(AppStrings.ADDRESS_PLEASE_INPUT_NAME);
      return false;
    }
    if (_phoneController.text.toString().isEmpty) {
      ToastUtil.showToast(AppStrings.ADDRESS_PLEASE_INPUT_PHONE);
      return false;
    }
    if (_model.addressArea.isEmpty) {
      ToastUtil.showToast(AppStrings.ADDRESS_PLEASE_SELECT_CITY);
      return false;
    }
    if (_addressDetailController.text.toString().isEmpty) {
      ToastUtil.showToast(AppStrings.ADDRESS_PLEASE_INPUT_DETAIL);
      return false;
    }
    if (_phoneController.text.toString().length != 11) {
      ToastUtil.showToast(AppStrings.ADDRESS_PLEASE_INPUT_CORRECT_PHONE);
      return false;
    }
    return true;
  }
}
