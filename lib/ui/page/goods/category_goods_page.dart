import 'package:flutter/material.dart';
import 'package:mall/ui/page/goods/category_goods_widget.dart';


class CategoryGoodsPage extends StatefulWidget {
 final String _categoryName;
 final int _categoryId;

  CategoryGoodsPage(this._categoryName, this._categoryId);

  @override
  _CategoryGoodsPageState createState() => _CategoryGoodsPageState();
}

class _CategoryGoodsPageState extends State<CategoryGoodsPage> {
  String _categoryName;
  int _categoryId;

  @override
  void initState() {
    super.initState();
    _categoryName = widget._categoryName;
    _categoryId = widget._categoryId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_categoryName),
        ),
        body: CategoryGoodsWidget(_categoryId));
  }
}
