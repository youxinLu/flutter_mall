import 'package:flutter/material.dart';
import 'package:mall/entity/footprint_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';

class FootprintView extends StatefulWidget {
  @override
  _FootprintViewState createState() => _FootprintViewState();
}

class _FootprintViewState extends State<FootprintView> {
  var _page = 1;
  var _limit = 10;
  List<ListData> _footprints = List();
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

    var parameters = {"page": _page, "limit": _limit};
    _mineService.footPrint(parameters,  (successList) {
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
                  return getGoodsItemView(_footprints[index], index);
                }),
      ),
    );
  }

  Widget getGoodsItemView(ListData footprint, int index) {
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
      onTap: () => _itemClick(footprint.goodsId),
      onLongPress: () => _showDeleteDialog(index),
    );
  }

  _showDeleteDialog(int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              Strings.TIPS,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            content: Text(
              Strings.MINE_FOOTPRINT_DELETE,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    Strings.CANCEL,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _deleteFootprint(_footprints[index].id, index);
                  },
                  child: Text(
                    Strings.CONFIRM,
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
            ],
          );
        });
  }

  _deleteFootprint(int id, int index) {

    var parameters = {
      "id": id,
    };
    _mineService.deleteFootPrint(parameters, (onSuccess) {
      setState(() {
        _footprints.removeAt(index);
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  _itemClick(int id) {
    NavigatorUtils.goGoodsDetails(context, id);
  }
}
