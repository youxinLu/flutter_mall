import 'package:mall/constant/app_parameters.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/view_model/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  bool _showTitle = false;
  String _pictureUrl;
  String _userName;
  int _collectionNumber = 0;
  int _footPrintfNumber = 0;
  int _couponNumber = 0;
  int _page = 1;
  int _limit = 20;
  bool _isFirst=true;

  bool get showTitle => _showTitle;

  String get pictureUrl => _pictureUrl;

  String get userName => _userName;

  int get footPrintfNumber => _footPrintfNumber;

  int get couponNumber => _couponNumber;

  int get collectionNumber => _collectionNumber;
  String text;

  bool get isFirst => _isFirst;

  refreshData() async {
    String token;
    await SharedPreferencesUtil.getInstance()
        .getString(AppStrings.TOKEN)
        .then((value) => token = value);
    if (token != null && token.isNotEmpty) {
      await SharedPreferencesUtil.getInstance()
          .getString(AppStrings.NICK_NAME)
          .then((value) => _userName = value);
      await SharedPreferencesUtil.getInstance()
          .getString(AppStrings.HEAD_URL)
          .then((value) => _pictureUrl = value);

      await SharedPreferencesUtil.getInstance()
          .getBool(AppStrings.IS_FIRST)
          .then((value) {
        _isFirst = value ??= true;
      });
      await _queryCoupon();
      await _queryFootPrint();
      await _queryCollection();
      notifyListeners();
    }
  }

  _queryCoupon() async {
    var couponParameters = {
      AppParameters.PAGE: _page,
      AppParameters.LIMIT: _limit
    };
    await _mineService
        .queryCoupon(couponParameters)
        .then((value) => _couponNumber = value.data.total);
  }

  _queryCollection() async {
    var collectionParameters = {
      AppParameters.TYPE: 0,
      AppParameters.PAGE: 1,
      AppParameters.LIMIT: 1000
    };

    await _mineService
        .queryCollect(collectionParameters)
        .then((value) => _collectionNumber = value.data.total);
  }

  _queryFootPrint() async {
    var footPrintParameters = {
      AppParameters.PAGE: _page,
      AppParameters.LIMIT: _limit
    };
    await _mineService
        .queryFootPrint(footPrintParameters)
        .then((value) => _footPrintfNumber = value.data.total);
  }

  collectionDataChange() {
    _queryCollection();
    notifyListeners();
  }

  footPrintDataChange() {
    _queryFootPrint();
  }

  setShowTitle(bool value) {
    _showTitle = value;
    notifyListeners();
  }

  setPersonInformation(String pictureUrl, String userName) {
    _pictureUrl = pictureUrl;
    _userName = userName;
  }
}
