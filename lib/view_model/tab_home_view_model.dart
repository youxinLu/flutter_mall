import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/service/home_service.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class TabHomeViewModel extends BaseViewModel {
  HomeService _homeService = HomeService();
  MineService _mineService = MineService();
  HomeEntity homeModelEntity;

  void loadTabHomeData() {
    _homeService.queryHomeData().then((response) {
      if (response.isSuccess) {
        homeModelEntity = response.data;
        pageState =
            homeModelEntity == null ? PageState.empty : PageState.hasData;
        print(homeModelEntity.couponList.length);
        notifyListeners();
      }
    }, onError: (errorMessage) {
      pageState = PageState.error;
      notifyListeners();
    });
  }

  Future<bool> receiveCoupon(int couponId) async {
    var parameters = {AppParameters.COUPON_ID: couponId};
    await _mineService.receiveCoupon(parameters).then((response) {
      return response.isSuccess;
    });
  }
}
