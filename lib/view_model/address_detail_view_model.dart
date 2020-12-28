import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/address_detail_entity.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class AddressDetailViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  AddressDetailEntity _addressDetailEntity;

  String _addressArea = "";
  bool _isDefault = false;
  String _name;
  String _phone;
  String _addressDetail;

  String _areaId;
  String _provinceName;
  String _cityName;
  String _countryName;
  int _id;
  String get addressArea => _addressArea;

  AddressDetailEntity get addressDetailEntity => _addressDetailEntity;

  bool get isDefault => _isDefault;

  String get name => _name;

  String get phone => _phone;

  String get addressDetail => _addressDetail;

  String get areaId => _areaId;

  String get provinceName => _provinceName;

  String get cityName => _cityName;

  String get countryName => _countryName;

  int get id => _id;

  setDefault(bool value, String name, String phone, String addressDetail) {
    _isDefault = value;
    _name = name;
    _phone = phone;
    _addressDetail = addressDetail;
    notifyListeners();
  }

  setAddressArea(String areaId, String provinceName, String cityName,
      String countryName, String name, String phone, String addressDetail) {
    _addressArea = provinceName + cityName + countryName;
    _areaId = areaId;
    _provinceName = provinceName;
    _cityName = cityName;
    _countryName = countryName;
    _name = name;
    _phone = phone;
    _addressDetail = addressDetail;
    notifyListeners();
  }

  queryAddressDetail(var addressId) {
    if (addressId == null || addressId == 0) {
      pageState = PageState.hasData;
      _addressDetailEntity = AddressDetailEntity();
      notifyListeners();
      return;
    }
    var parameters = {AppParameters.ID: addressId.toString()};

    _mineService.queryAddressDetail(parameters).then((response) {
      if (response.isSuccess) {
        pageState = PageState.hasData;
        _addressDetailEntity = response.data;
        _isDefault = _addressDetailEntity.isDefault;
        _addressArea = _addressDetailEntity.province +
            _addressDetailEntity.city +
            _addressDetailEntity.county;
        _name = _addressDetailEntity.name;
        _phone = addressDetailEntity.tel;
        _addressDetail = _addressDetailEntity.addressDetail;

        _areaId = _addressDetailEntity.areaCode;
        _provinceName = _addressDetailEntity.province;
        _cityName = _addressDetailEntity.city;
        _countryName=_addressDetailEntity.county;
        _id=_addressDetailEntity.id;
        notifyListeners();
      } else {
        pageState = PageState.error;
        ToastUtil.showToast(response.message);
      }
    });
  }

  Future<bool> saveAddress(
      String addressDetail,
      String areaCode,
      String city,
      String county,
      String id,
      bool isDefault,
      String name,
      String province,
      String tel) async {
    var parameters = {
      AppParameters.ADDRESS_DETAIL: addressDetail,
      AppParameters.AREA_CODE: areaCode,
      AppParameters.CITY: city,
      AppParameters.COUNTY: county,
      AppParameters.ID: id,
      AppParameters.IS_DEFAULT: isDefault,
      AppParameters.NAME: name,
      AppParameters.PROVINCE: province,
      AppParameters.TEL: tel
    };
    bool result = false;
    await _mineService.addAddress(parameters).then((response) {
      result = response.isSuccess;
      if (!result) {
        ToastUtil.showToast(response.message);
      }
    });
    return result;
  }

  Future<bool> deleteAddress(String id) async {
    var parameters = {AppParameters.ID: id};
    bool result = false;
    await _mineService.deleteAddress(parameters).then((response) {
      result = response.isSuccess;
    });
    return result;
  }
}
