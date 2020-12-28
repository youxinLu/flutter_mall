import 'package:mall/constant/app_parameters.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/model/collection_entity.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/model/goods_detail_entity.dart';
import 'package:mall/view_model/page_state.dart';

class GoodsDetailViewModel extends BaseViewModel {
  GoodsService _goodsService = GoodsService();
  MineService _mineService = MineService();
  GoodsDetailEntity _goodsDetailEntity;
  bool _isCollection = false;
  String _toastMessage;
  int _specificationId;

  String get toastMessage => _toastMessage;

  GoodsDetailEntity get goodsDetailEntity => _goodsDetailEntity;

  bool get isCollection => _isCollection;

  int get specificationId => _specificationId;

  setSpecificationId(int value) {
    _specificationId = value;
    notifyListeners();
  }

  void getGoodsDetail(int goodsId) async {
    var parameters = {AppParameters.ID: goodsId};
    await _goodsService.getGoodsDetailData(parameters).then((response) {
      if (response.isSuccess) {
        pageState = response.data == null ? PageState.empty : PageState.hasData;
        _goodsDetailEntity = response.data;
        _specificationId =
            _goodsDetailEntity.specificationList[0].valueList[0].id;
      } else {
        errorNotify(response.message);
      }
    });
     queryAllCollection(goodsId);
  }

  Future<bool> addOrDeleteCollect(var goodsId) async {
    bool result = false;
    var parameters = {AppParameters.TYPE: 0, AppParameters.VALUE_ID: goodsId};
    await _mineService.addOrDeleteCollect(parameters).then((response) {
      result = response.isSuccess;
      if (response.isSuccess) {
        _isCollection = !isCollection;
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
      }
    });
    return result;
  }

  Future<int> buy(int goodsId, int productId, int number) async {
    int result = 0;
    var parameters = {
      AppParameters.GOODS_ID: goodsId,
      AppParameters.PRODUCT_ID: productId,
      AppParameters.NUMBER: number,
      AppParameters.GROUPON_RULES_ID: 0,
      AppParameters.GROUPON_LINK_ID: 0
    };
    await _goodsService.buy(parameters).then((response) {
      if (response.isSuccess) {
        result = response.data;
      }
    });
    return result;
  }

  void queryAllCollection(int goodsId) {
    var parameters = {
      AppParameters.TYPE: 0,
      AppParameters.PAGE: 1,
      AppParameters.LIMIT: 1000
    };
    _mineService.queryCollect(parameters).then((response) {
      if (response.isSuccess) {
        CollectionEntity collectionEntity = response.data;
        List<CollectionList> collections = collectionEntity.xList;
        _isCollection = isAlreadyCollection(collections, goodsId);
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
        notifyListeners();
      }
    });
  }

  bool isAlreadyCollection(List<CollectionList> collections, int goodsId) {
    for (CollectionList collectionList in collections) {
      if (collectionList.valueId == goodsId) {
        return true;
      }
    }
    return false;
  }
}
