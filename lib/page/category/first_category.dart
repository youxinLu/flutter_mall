import 'package:flutter/material.dart';
import 'package:mall/entity/first_level_category.dart';
import 'package:mall/event/category_event.dart';
import 'package:mall/service/category_service.dart';

class FirstLevelCategoryView extends StatefulWidget {
  @override
  _FirstLevelCategoryViewState createState() => _FirstLevelCategoryViewState();
}

class _FirstLevelCategoryViewState extends State<FirstLevelCategoryView> {
  CategoryService categoryService = CategoryService();
  List<FirstLevelCategory> firstLevelLisCategorys = List();
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    categoryService.getCategoryData((firstLevelCategoryList) {
      eventBus.fire(CategoryEvent(firstLevelCategoryList[0].id,
          firstLevelCategoryList[0].name, firstLevelCategoryList[0].picUrl));
      setState(() {
        firstLevelLisCategorys = firstLevelCategoryList;
        // _getSubCategory();
      });
    });
    print("FirstLevelCategoryView_initState");
  }

//    categoryService.getCategoryData(
//        onSuccessList(List < FirstLevelCategory > firstLevelCategoryList)) {
//      eventBus.fire(CategoryEvent(firstLevelCategoryList[0].id,
//          firstLevelCategoryList[0].name, firstLevelCategoryList[0].picUrl));
//      setState(() {
//        firstLevelLisCategorys.clear();
//        firstLevelLisCategorys.addAll(firstLevelCategoryList);
//        // _getSubCategory();
//      });
//    });
//    }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: firstLevelLisCategorys.length,
            itemBuilder: (BuildContext context, int index) {
              return _getFirstLevelView(firstLevelLisCategorys[index], index);
            }));
  }

  _itemClick(int index) {
    setState(() {
      _selectIndex = index;
    });
    eventBus.fire(CategoryEvent(
        firstLevelLisCategorys[index].id,
        firstLevelLisCategorys[index].name,
        firstLevelLisCategorys[index].picUrl));
    print("_itemClick");
  }

  Widget _getFirstLevelView(FirstLevelCategory firstLevelCategory, int index) {
    return GestureDetector(
      onTap: () => _itemClick(index),
      child: Container(
          width: 100.0,
          height: 50.0,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 48,
                alignment: Alignment.center,
                child: Text(firstLevelCategory.name,
                    style: index == _selectIndex
                        ? TextStyle(
                            fontSize: 14.0, color: Colors.deepOrangeAccent)
                        : TextStyle(fontSize: 14.0, color: Colors.black54)),
              ),
              index == _selectIndex
                  ? Divider(
                      height: 2.0,
                      color: Colors.deepOrangeAccent,
                    )
                  : Divider(
                      color: Colors.white,
                      height: 1.0,
                    )
            ],
          )),
    );
  }
}
