import 'package:flutter/material.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/entity/collect_entity.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/utils/navigator_util.dart';

class CollectView extends StatefulWidget {
  @override
  _CollectViewState createState() => _CollectViewState();
}

class _CollectViewState extends State<CollectView> {
  MineService _mineService = MineService();
  var token;
  var _page = 1;
  var _limit = 10;
  var _type = 0;
  List<Collect> _collects = List();

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((value) {
      token = value;
      _queryCollect();
    });
  }

  _queryCollect() {
    Options options = Options();
    options.headers["token"] = token;
    var parameters = {"type": _type, "page": _page, "limit": _limit};
    _mineService.queryCollect(parameters, options, (successList) {
      setState(() {
        _collects = successList;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_COLLECT),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: _collects.length == 0
            ? EmptyView()
            : GridView.builder(
                itemCount: _collects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: ScreenUtil.instance.setWidth(10.0),
                    crossAxisSpacing: ScreenUtil.instance.setHeight(10.0)),
                itemBuilder: (BuildContext context, int index) {
                  return getGoodsItemView(_collects[index], index);
                }),
      ),
    );
  }

  Widget getGoodsItemView(Collect collect, int index) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: 320,
            height: 460,
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    collect.picUrl,
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    collect.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    "¥${collect.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            )),
      ),
      onTap: () => _itemClick(collect.valueId),
    );
  }

  _itemClick(int id) {
    NavigatorUtils.goGoodsDetails(context, id);
  }
}
