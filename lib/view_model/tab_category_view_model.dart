import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/category_entity.dart';
import 'package:mall/service/category_service.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class TabCategoryViewModel extends BaseViewModel {
  var _categoryId;
  var _categoryName;
  var _categoryPicture;
  var _selectIndex = 0;

  List<CategoryEntity> _parentCategories = List<CategoryEntity>();
  List<CategoryEntity> _childCategories = List<CategoryEntity>();
  CategoryService categoryService = CategoryService();
  bool _parentShouldBuild = false;
  bool _childShouldBuild = false;

  get parentShouldBuild => _parentShouldBuild;

  get childShouldBuild => _childShouldBuild;

  get parentCategories => _parentCategories;

  get childCategories => _childCategories;

  get categoryId => _categoryId;

  get categoryName => _categoryName;

  get categoryPicture => _categoryPicture;

  get selectIndex => _selectIndex;

  void getParentCategory() {
    categoryService.getCategoryData().then((response) {
      if (response.isSuccess) {
        _parentCategories = response.data.categories;
        if (_parentCategories.length > 0) {
          _categoryId = _parentCategories[0].id;
          _categoryName = _parentCategories[0].name;
          _categoryPicture = _parentCategories[0].picUrl;
          _parentShouldBuild = true;
          getSecondCategory(_categoryId);
        } else {
          pageState = PageState.empty;
        }

      } else {
        errorNotify(response.message);
      }
    });
  }

  void getSecondCategory(var categoryId) {
    var parameters = {AppParameters.ID: categoryId};
    categoryService.getSubCategoryData(parameters).then((response) {
      if (response.isSuccess) {
        _childCategories = response.data.categories;
        notifyListeners();
      } else {
        errorNotify(response.message);
        notifyListeners();
      }
    });
  }

  void setParentCategorySelect(int index) {
    _selectIndex = index;
    _categoryPicture = _parentCategories[index].picUrl;
    _categoryName=_parentCategories[index].name;
    getSecondCategory(parentCategories[index].id);
  }

  onRefresh() {
    _selectIndex = 0;
    getParentCategory();
  }

  parentRebuild() {
    _parentShouldBuild = false;
  }
}
