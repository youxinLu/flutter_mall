import 'package:flutter/material.dart';
import 'package:mall/page/category/first_category.dart';
import 'package:mall/entity/first_level_category.dart';
import 'package:mall/service/category_service.dart';
import 'package:mall/page/category/sub_category.dart';
import 'package:mall/entity/sub_category_entity.dart';
import 'package:mall/constant/string.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryService categoryService = CategoryService();
  List<FirstLevelCategory> firstLevelCategorys = List();
  List<SubCategoryEntity> subCategoryEntitys = List();
  String subCategoryImage;
  String subCategoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.MALL),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: Container(
            child: Row(children: <Widget>[
          new Expanded(
            flex: 2,
            child: FirstLevelCategoryView(),
          ),
          new Expanded(
            flex: 8,
            child: SubCategoryView(),
          ),
        ])));
  }
}
