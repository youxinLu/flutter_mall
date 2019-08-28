import 'package:flutter/material.dart';
import 'package:mall/service/goods_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/goods/goods_list.dart';
import 'package:mall/service/category_service.dart';
import 'package:mall/entity/category_title_entity.dart';

class CategoryListView extends StatefulWidget {
  String categoryName;
  int categoryId;

  CategoryListView(
      {Key key, @required this.categoryName, @required this.categoryId})
      : super(key: key);

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  GoodsService goodsService = GoodsService();
  CategoryService _categoryService = CategoryService();
  CategoryTitleEntity _categoryTitleEntity;
  List<BrotherCategory> brotherCategory = List();
  var categoryFuture;
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    categoryFuture = _categoryService
        .getCategoryTitle({"id": widget.categoryId}, (categoryTitles) {
      _categoryTitleEntity = categoryTitles;
      brotherCategory = _categoryTitleEntity.brotherCategory;
      currentIndex = getCurrentIndex();
    }, (error) {});
  }

  getCurrentIndex() {
    for (int i = 0; i < brotherCategory.length; i++) {
      if (brotherCategory[i].id == _categoryTitleEntity.currentCategory.id) {
        return i;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: categoryFuture,
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            switch (asyncSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SpinKitFoldingCube(
                  size: 40.0,
                  color: Colors.deepOrangeAccent,
                );
              default:
                if (asyncSnapshot.hasError)
                  return new Text(Strings.SERVER_EXCEPTION);
                else
                  _scrollController = ScrollController();
                _tabController = TabController(
                    initialIndex: currentIndex,
                    length: brotherCategory.length,
                    vsync: this)
                  ..addListener(() {});
                return getCategoryView();
            }
          }),
    );
  }

  Widget getCategoryView() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.deepOrangeAccent,
            tabs: getTabBars()),
      ),
      body: TabBarView(
        children: getTabBarViews(),
        controller: _tabController,
      ),
    );
  }

  List<Widget> getTabBars() {
    List<Widget> tabBar = List();
    for (var category in brotherCategory) {
      tabBar.add(getTabBar(category));
    }
    return tabBar;
  }

  List<Widget> getTabBarViews() {
    List<Widget> tabBarView = List();
    for (var i = 0; i < brotherCategory.length; i++) {
      tabBarView.add(GoodsList(brotherCategory[i].id));
    }
    return tabBarView;
  }

  Widget getTabBar(BrotherCategory category) {
    return Tab(
      text: category.name,
    );
  }
}
