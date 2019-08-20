import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/widgets/divider_line.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';

class SearchGoodsView extends StatefulWidget {
  @override
  _SearchGoodsViewState createState() => _SearchGoodsViewState();
}

class _SearchGoodsViewState extends State<SearchGoodsView> {
  TextEditingController _editingController = TextEditingController();
  List<String> _keywords;
  GoodsService _goodsService = GoodsService();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor:
          Colors.deepOrangeAccent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: ScreenUtil.instance.setHeight(100.0),
              color: Colors.deepOrangeAccent,
              child: Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(60.0),
                      top: ScreenUtil.instance.setHeight(10.0),
                      bottom: ScreenUtil.instance.setHeight(10.0),
                      right: ScreenUtil.instance.setWidth(60.0)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.white,
                        width: ScreenUtil.instance.setWidth(1.0)),
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(40.0)),
                  ),
                  child: TextField(
                    onEditingComplete: _searchKeyWords,
                    controller: _editingController,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: ScreenUtil.instance.setWidth(50.0),
                        color: Colors.deepOrangeAccent,
                      ),
                      hintText: Strings.GOODS_SEARCH_HINT,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  )),
            ),
            Expanded(
                child: Container(
              height: double.infinity,
              margin:
                  EdgeInsets.only(top: ScreenUtil.instance.setHeight(110.0)),
              child: _keywords == null || _keywords.length == 0
                  ? Container(
                      alignment: Alignment.center,
                      child: EmptyView(),
                    )
                  : ListView.separated(
                      itemCount: _keywords.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return DividerLineView();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _keyWordView(_keywords[index]);
                      }),
            ))
          ],
        ),
      ),
    );
  }

  _searchKeyWords() {
    var parameters = {"keyword": _editingController.text};
    _goodsService.searchGoods(parameters, (success) {
      setState(() {
        _keywords = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
      setState(() {
        _keywords = null;
      });
    });
  }

  Widget _keyWordView(String keyword) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil.instance.setHeight(80.0),
      child: Text(
        keyword,
        style: TextStyle(
            color: Colors.black54, fontSize: ScreenUtil.instance.setSp(26.0)),
      ),
    );
  }
}
