import 'package:flutter/material.dart';
import 'package:mall/entity/footprint_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';

class FootprintView extends StatefulWidget {
  @override
  _FootprintViewState createState() => _FootprintViewState();
}

class _FootprintViewState extends State<FootprintView> {
  var _page = 1;
  var _limit = 10;
  List<Footprint> _footprints = List();
  MineService _mineService = MineService();
  var token;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((value) {
      if (value != null) {
        token = value;
        _getFootprintData();
      }
    });
  }

  _getFootprintData() {
    Options options = Options();
    options.headers["token"] = token;
    var parameters = {"page": _page, "limit": _limit};
    _mineService.footPrint(parameters, options, (successList) {
      setState(() {
        _footprints = successList;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_FOOTPRINT),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: _footprints.length == 0
            ? EmptyView()
            : GridView.builder(
                itemCount: _footprints.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: ScreenUtil.instance.setWidth(10.0),
                    crossAxisSpacing: ScreenUtil.instance.setHeight(10.0)),
                itemBuilder: (BuildContext context, int index) {
                  return getGoodsItemView(_footprints[index]);
                }),
      ),
    );
  }

  Widget getGoodsItemView(Footprint footprint) {
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
                    footprint.picUrl,
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    footprint.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    "¥${footprint.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            )),
      ),
      onTap: () => _itemClick(footprint.id),
    );
  }

  _itemClick(int id) {
    NavigatorUtils.goGoodsDetails(context, id);
  }
}
