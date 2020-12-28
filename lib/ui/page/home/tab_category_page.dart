import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/category_entity.dart';
import 'package:mall/ui/widgets/empty_data.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/refresh_state_util.dart';
import 'package:mall/view_model/tab_category_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabCategoryPage extends StatefulWidget {
  @override
  _TabCategoryPageState createState() => _TabCategoryPageState();
}

class _TabCategoryPageState extends State<TabCategoryPage> {
  TabCategoryViewModel _tabCategoryViewModel = TabCategoryViewModel();
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _tabCategoryViewModel.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabCategoryViewModel>(
      create: (_) => _tabCategoryViewModel,
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.CATEGORY),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColors.COLOR_FFFFFF,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: Consumer<TabCategoryViewModel>(
            builder: (context, model, child) {
              RefreshStateUtil.getInstance()
                  .stopRefreshOrLoadMore(_refreshController);
              return RefreshConfiguration(
                child: SmartRefresher(
                    enablePullUp: false,
                    header: WaterDropMaterialHeader(
                      backgroundColor: AppColors.COLOR_FF5722,
                    ),
                    controller: _refreshController,
                    onRefresh: () => _tabCategoryViewModel.onRefresh(),
                    child: Container(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          new Expanded(
                            flex: 2,
                            child: _parentCategoryWidget(_tabCategoryViewModel),
                          ),
                          new Expanded(
                            flex: 8,
                            child: _tabCategoryViewModel
                                        .childCategories.length ==
                                    0
                                ? EmptyDataView()
                                : _childCategoryWidget(_tabCategoryViewModel),
                          ),
                        ]))),
              );
            },
          )),
    );
  }

  Widget _parentCategoryWidget(TabCategoryViewModel tabCategoryViewModel) {
    return Selector<TabCategoryViewModel, TabCategoryViewModel>(
      shouldRebuild: (previous, next) => previous.parentShouldBuild,
      selector: (context, provider) => provider,
      builder: (context, provider, child) {
        provider.parentRebuild();
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: provider.parentCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Selector<TabCategoryViewModel, int>(
                selector: (context, provider) {
                  return provider.selectIndex;
                },
                builder: (context, data, child) {
                  return _getFirstLevelView(
                      provider.parentCategories[index], index, data);
                },
              );
            });
      },
    );
  }

  _itemParentClick(int index) {
    _tabCategoryViewModel.setParentCategorySelect(index);
  }

  Widget _getFirstLevelView(
      CategoryEntity categoryEntity, int index, int selectIndex) {
    return InkWell(
      onTap: () => _itemParentClick(index),
      child: Container(
          color: AppColors.COLOR_FFFFFF,
          width: ScreenUtil().setWidth(AppDimens.DIMENS_200),
          height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Offstage(
                offstage: selectIndex != index,
                child: Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                      bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                  color: AppColors.COLOR_FF5722,
                  width: ScreenUtil().setWidth(AppDimens.DIMENS_3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                height: ScreenUtil().setHeight(AppDimens.DIMENS_80),
                alignment: Alignment.center,
                child: Text(
                  categoryEntity.name,
                  style: selectIndex == index
                      ? FMTextStyle.color_ff5722_size_42
                      : FMTextStyle.color_333333_size_42,
                ),
              )
            ],
          )),
    );
  }

  Widget _childCategoryWidget(TabCategoryViewModel tabCategoryViewModel) {
    return Selector<TabCategoryViewModel, List<CategoryEntity>>(builder:
        (BuildContext context, List<CategoryEntity> data, Widget child) {
      return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: ScreenUtil().setHeight(AppDimens.DIMENS_300),
              child: Image.network(
                _tabCategoryViewModel.categoryPicture ?? AppStrings.DEFAULT_URL,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_10)),
            ),
            Center(
              child: Text(
                _tabCategoryViewModel.categoryName ?? "",
                style: FMTextStyle.color_333333_size_42,
              ),
            ),
            GridView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: _tabCategoryViewModel.childCategories.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: ScreenUtil().setWidth(AppDimens.DIMENS_1),
                    childAspectRatio: 1.0,
                    //垂直单个子Widget之间间距
                    crossAxisSpacing:
                        ScreenUtil().setHeight(AppDimens.DIMENS_10)),
                itemBuilder: (BuildContext context, int index) {
                  return _getChildItemView(
                      _tabCategoryViewModel.childCategories[index]);
                }),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
            ),
          ],
        ),
      );
    }, selector:
        (BuildContext context, TabCategoryViewModel tabCategoryViewModel) {
      return tabCategoryViewModel.childCategories;
    });
  }

  _itemChildClick(int categoryId, String categoryName) {
    NavigatorUtil.goCategoryGoodsListPage(context, categoryName, categoryId);
  }

  Widget _getChildItemView(CategoryEntity categoryEntity) {
    return GestureDetector(
      child: Card(
          child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setHeight(AppDimens.DIMENS_300),
        height: ScreenUtil().setHeight(AppDimens.DIMENS_300),
        child: Column(
          children: <Widget>[
            Image.network(
              categoryEntity.picUrl,
              fit: BoxFit.fill,
              width: ScreenUtil().setWidth(AppDimens.DIMENS_160),
              height: ScreenUtil().setHeight(AppDimens.DIMENS_160),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_10)),
            ),
            Text(
              categoryEntity.name,
              style: FMTextStyle.color_333333_size_42,
            ),
          ],
        ),
      )),
      onTap: () => _itemChildClick(categoryEntity.id, categoryEntity.name),
    );
  }
}
