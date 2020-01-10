import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/address_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mall/service/address_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/fluro_convert_utils.dart';
import 'package:mall/widgets/empty_view.dart';

class AddressView extends StatefulWidget {
  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  List<ListData> _addressData;
  AddressService addressService = AddressService();
  var addressFuture;
  var token;

  @override
  void initState() {
    super.initState();
    _getAddressData();
  }

  _getAddressData() {
    addressService.getAddressList((addressList) {
      setState(() {
        _addressData = addressList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MY_ADDRESS),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
              child: Container(
            margin: EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => _goAddressEdit(0),
              child: Text(Strings.ADD_ADDRESS),
            ),
          ))
        ],
      ),
      body: _addressData != null && _addressData.length > 0
          ? Container(
              child: ListView.builder(
                  itemCount: _addressData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _addressItemView(_addressData[index]);
                  }))
          : EmptyView(),
    );
  }

  Widget _addressItemView(ListData addressData) {
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
      height: ScreenUtil.instance.setHeight(160.0),
      alignment: Alignment.center,
      child: Card(
          child: InkWell(
        onTap: () => _goFillInOrder(addressData),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  right: ScreenUtil.instance.setWidth(10.0),
                  left: ScreenUtil.instance.setWidth(10.0)),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(ScreenUtil.instance.setWidth(40)),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  width: ScreenUtil.instance.setWidth(80),
                  height: ScreenUtil.instance.setHeight(80),
                  child: Text(
                    addressData.name.substring(0, 1),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(40)),
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
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(10.0))),
                    Text(
                      addressData.tel,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(20.0))),
                Text(
                  addressData.province +
                      addressData.city +
                      addressData.county +
                      addressData.addressDetail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // 显示不完，就在后面显示点点
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0),
                  ),
                )
              ],
            )),
            Container(
                width: ScreenUtil.instance.setWidth(120.0),
                margin:
                    EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: Border(
                        left: BorderSide(
                            color: Colors.grey[350],
                            width: ScreenUtil.instance.setWidth(1.0)))),
                padding:
                    EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                child: InkWell(
                  onTap: () => _goAddressEdit(addressData.id),
                  child: Text(
                    Strings.ADDRESS_EDIT,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                ))
          ],
        ),
      )),
    );
  }

  _goFillInOrder(ListData addressData) {
    Navigator.of(context).pop(FluroConvertUtil.objecttToString(addressData));
  }

  _goAddressEdit(var addressId) {
    NavigatorUtils.goAddressEdit(context, addressId).then((bool) {
      _getAddressData();
    });
  }
}
