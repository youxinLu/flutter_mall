import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:mall/entity/address_entity.dart';
import 'package:mall/service/address_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/toast_util.dart';

class EditAddressView extends StatefulWidget {
  var addressId;

  EditAddressView(this.addressId);

  @override
  _EditAddressViewState createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  TextEditingController _nameController;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressDetailController = TextEditingController();
  AddressService _addressService = AddressService();
  ListData _addressData;
  var _cityText;
  var _isDefault = false;
  var _addressId;
  var token;
  var _areaId;
  var _provinceName;
  var _cityName;
  var _countryName;
  Options options = Options();

  @override
  void initState() {
    super.initState();
    _addressId = widget.addressId;
    SharedPreferencesUtils.getToken().then((onValue) {
      if (onValue != null) {
        token = onValue;
      }
      if (_addressId != 0) {
        _queryAddressDetail(onValue);
      } else {
        _initController();
      }
    });
  }

  _initController() {
    _nameController = TextEditingController(
      text: _addressData == null ? "" : _addressData.name,
    );
    _phoneController = TextEditingController(
      text: _addressData == null ? "" : _addressData.tel,
    );
    _addressDetailController = TextEditingController(
      text: _addressData == null ? "" : _addressData.addressDetail,
    );
  }

  _queryAddressDetail(var token) {
    var parameters = {"id": _addressId};
    _addressService.addressDetail(parameters, (addressDetail) {
      setState(() {
        _addressData = addressDetail;
        _areaId = _addressData.areaCode;
        _cityText =
            _addressData.province + _addressData.city + _addressData.county;
        _isDefault = _addressData.isDefault;
        _provinceName = _addressData.province;
        _cityName = _addressData.city;
        _countryName = _addressData.county;
      });
      _initController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.ADDRESS_EDIT_TITLE),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20.0),
            right: ScreenUtil.instance.setWidth(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
                maxLines: 1,
                controller: _nameController,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                decoration: InputDecoration(
                    hintText: Strings.ADDRESS_PLEASE_INPUT_NAME,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)))),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            TextField(
                maxLines: 1,
                controller: _phoneController,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                decoration: InputDecoration(
                    hintText: Strings.ADDRESS_PLEASE_INPUT_PHONE,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)))),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            InkWell(
                onTap: () => this.show(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil.instance.setHeight(100),
                  child: Text(
                    _cityText == null
                        ? Strings.ADDRESS_PLEASE_SELECT_CITY
                        : _cityText,
                    style: _cityText == null
                        ? TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.instance.setSp(26.0))
                        : TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                )),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            TextField(
                maxLines: 1,
                controller: _addressDetailController,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                decoration: InputDecoration(
                    hintText: Strings.ADDRESS_PLEASE_INPUT_DETAIL,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)))),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(100.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Strings.ADDRESS_SET_DEFAULT,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Switch(
                        value: _isDefault,
                        activeColor: Colors.deepOrangeAccent,
                        onChanged: (bool) {
                          setState(() {
                            this._isDefault = bool;
                          });
                        }),
                  )),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            Offstage(
              offstage: _addressId == 0,
              child: InkWell(
                  onTap: () => _delete(context),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil.instance.setHeight(100),
                    child: Text(
                      Strings.ADDRESS_DELETE,
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  )),
            ),
            Offstage(
                offstage: _addressId == 0,
                child: Divider(
                  color: Colors.grey[350],
                  height: ScreenUtil.instance.setHeight(1.0),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.deepOrangeAccent,
            height: ScreenUtil.instance.setHeight(100.0),
            child: InkWell(
              onTap: () => _submit(),
              child: Text(
                Strings.SUBMIT,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.instance.setSp(28.0)),
              ),
            )),
      ),
    );
  }

  show(context) async {
    Result temp = await CityPickers.showCityPicker(
      context: context,
      itemExtent: ScreenUtil.instance.setHeight(80.0),
      itemBuilder: (item, list, index) {
        return Center(
            child: Text(item,
                maxLines: 1,
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(26.0))));
      },
      height: ScreenUtil.instance.setHeight(400),
    );

    print(temp);
    setState(() {
      _cityText = temp.provinceName + temp.cityName + temp.areaName;
      _areaId = temp.areaId;
      _provinceName = temp.provinceName;
      _cityName = temp.cityName;
      _countryName = temp.areaName;
    });
  }

  _delete(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              Strings.TIPS,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(30.0),
                  color: Colors.black54),
            ),
            content: Text(
              Strings.ADDRESS_DELETE,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(30.0),
                  color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  Strings.CANCEL,
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
              ),
              FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  _deleteAddress();
                },
                child: Text(
                  Strings.CONFIRM,
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
              ),
            ],
          );
        });
  }

  _deleteAddress() {
    var parameters = {"id": _addressData.id};
    _addressService.deleteAddress( parameters, (onSuccess) {
      ToastUtil.showToast(Strings.ADDRESS_DELETE_SUCCESS);
      Navigator.pop(context);
    }, (onFail) {
      ToastUtil.showToast(onFail);
    });
  }

  _submit() {
    if (_judgeAddressBody()) {
      var parameters = {
        "addressDetail": _addressDetailController.text.toString(),
        "areaCode": _areaId,
        "city": _cityName,
        "county": _countryName,
        "id": _addressData == null ? 0 : _addressData.id,
        "isDefault": _isDefault,
        "name": _nameController.text.toString(),
        "province": _provinceName,
        "tel": _phoneController.text.toString(),
      };
      _addressService.addAddress( parameters, (success) {
        ToastUtil.showToast(Strings.SUBMIT_SUCCESS);
        Navigator.of(context).pop(true);
      }, (error) {
        ToastUtil.showToast(error);
      });
    }
  }

  bool _judgeAddressBody() {
    if (_addressDetailController.text.toString().isEmpty) {
      ToastUtil.showToast(Strings.ADDRESS_PLEASE_INPUT_DETAIL);
      return false;
    }
    if (_nameController.text.toString().isEmpty) {
      ToastUtil.showToast(Strings.ADDRESS_PLEASE_INPUT_NAME);
      return false;
    }
    if (_phoneController.text.toString().isEmpty) {
      ToastUtil.showToast(Strings.ADDRESS_PLEASE_INPUT_PHONE);
      return false;
    }
    return true;
  }
}
