import 'package:flutter/material.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryMenu extends StatelessWidget {
  List<Categorie> categoryList;

  CategoryMenu(this.categoryList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
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
                    mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
                    //垂直单个子Widget之间间距
                    crossAxisSpacing:ScreenUtil.instance.setWidth(20.0),),
              ));
  }
  Widget _getGridViewItem(Categorie categoryEntity) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.network(
            categoryEntity.iconUrl,
            width: ScreenUtil.instance.setWidth(60.0),
            height: ScreenUtil.instance.setWidth(60.0),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
          ),
          Text(
            categoryEntity.name,
            style: TextStyle(fontSize: ScreenUtil.instance.setSp(26.0), color: Colors.black87),
          )
        ],
      ),
    );
  }
}
