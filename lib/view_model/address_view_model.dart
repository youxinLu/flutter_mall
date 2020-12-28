import 'package:mall/model/address_entity.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class AddressViewModel extends BaseViewModel {
  MineService _mineService = MineService();
  List<AddressList> _address = List();

  List<AddressList> get address => _address;

  queryAddressData() {
    _mineService.getAddressList().then((response) {
      if (response.isSuccess) {
        address.clear();
        _address = response.data.xList;
        pageState = address.length == 0 ? PageState.empty : PageState.hasData;
        notifyListeners();
      } else {
        errorNotify(response.message);
      }
    });
  }
}
