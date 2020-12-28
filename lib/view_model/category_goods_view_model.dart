import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/category_goods_entity.dart';
import 'package:mall/model/category_title_entity.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/service/category_service.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class CategoryGoodsViewModel extends BaseViewModel {
  GoodsService _goodsService = GoodsService();
  CategoryService _categoryService = CategoryService();
  CategoryTitleEntity _categoryTitleEntity;
  CategoryGoodsEntity _categoryGoodsEntity;
  bool _canLoadMore = false;
  List<GoodsEntity> _goods = List();

  List<GoodsEntity> get goods => _goods;

  CategoryTitleEntity get categoryTitleEntity => _categoryTitleEntity;

  bool get canLoadMore => _canLoadMore;

  CategoryGoodsEntity get categoryGoodsEntity => _categoryGoodsEntity;

  void queryCategoryGoods(int categoryId, int pageIndex, int limit) {
    var parameters = {
      AppParameters.CATEGORY_ID: categoryId,
      AppParameters.PAGE: pageIndex,
      AppParameters.LIMIT: limit
    };
    _goodsService.getCategoryGoodsData(parameters).then((response) {
      if (response.isSuccess) {
        _categoryGoodsEntity = response.data;
        if (pageIndex == 1) {
          _goods.clear();
          _goods = response.data.xList;
        } else {
          _goods.addAll(response.data.xList);
        }
        pageState = _goods.length == 0 ? PageState.empty : PageState.hasData;
        _canLoadMore = response.data.total > _goods.length;
        notifyListeners();
      } else {
        errorNotify(response.message);
      }
    });
  }

  void queryCategoryName(int categoryId) {
    var parameters = {
      AppParameters.ID: categoryId,
    };
    _categoryService.getCategoryTitle(parameters).then((response) {
      if (response.isSuccess) {
        _categoryTitleEntity = response.data;
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
      }
    });
  }
}
