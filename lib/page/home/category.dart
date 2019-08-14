import 'package:flutter/material.dart';
import 'package:mall/entity/category_entity.dart';

class CategoryMenu extends StatelessWidget {
  List<CategoryEntity> categoryList;

  CategoryMenu(this.categoryList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
//        categoryList == null || categoryList.length == 0
//            ? Container(
//                color: Colors.grey,
//                alignment: Alignment.center,
//                child: Text(
//                  Strings.NO_DATA_TEXT,
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                ),
//              ):
             GridView.builder(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                //  return _getGridViewItem(categoryList[index]);
                  return _getGridViewItem(categoryList[index]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //单个子Widget的水平最大宽度
                    crossAxisCount: 5,
                    //水平单个子Widget之间间距
                    mainAxisSpacing: 20.0,
                    //垂直单个子Widget之间间距
                    crossAxisSpacing: 20.0),
              ));
  }
  Widget _getGridViewItem(CategoryEntity categoryEntity) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.network(
            categoryEntity.iconUrl,
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Text(
            categoryEntity.name,
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
          )
        ],
      ),
    );
  }
}
