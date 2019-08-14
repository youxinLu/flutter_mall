import 'package:flutter/material.dart';
import 'package:mall/entity/sub_category_entity.dart';
import 'package:mall/service/goods_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/goods/goods_list.dart';

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
  List<SubCategoryEntity> topCategoryEntitys = List();
  var categoryFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("CategoryListView_initState");
    categoryFuture = goodsService.getCategoryData({"id": widget.categoryId},
        (subCategoryEntityList) {
      topCategoryEntitys = subCategoryEntityList;
    });
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
                    initialIndex: 0,
                    length: topCategoryEntitys.length,
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
    for (var category in topCategoryEntitys) {
      tabBar.add(getTabBar(category));
    }
    return tabBar;
  }

  List<Widget> getTabBarViews() {
    List<Widget> tabBarView = List();
    for (var i = 0; i < topCategoryEntitys.length; i++) {
      tabBarView.add(GoodsList(topCategoryEntitys[i].id));
    }
    return tabBarView;
  }

  Widget getTabBar(SubCategoryEntity category) {
    return Tab(
      text: category.name,
    );
  }
}
