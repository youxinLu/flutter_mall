import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/divider_line.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/service/mine_service.dart';
import 'package:dio/dio.dart';
import 'package:mall/utils/shared_preferences_util.dart';

class FeedBackView extends StatefulWidget {
  @override
  _FeedBackViewState createState() => _FeedBackViewState();
}

class _FeedBackViewState extends State<FeedBackView> {
  var feedBack = "";
  TextEditingController _contentController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  MineService _mineService = MineService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.FEED_BACK),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                right: ScreenUtil.instance.setWidth(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: ScreenUtil.instance.setHeight(100.0),
                  child: InkWell(
                    onTap: () => _showFeedBackDialog(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Strings.PLEASE_SELECT_FEEDBACK_TYPE,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenUtil.instance.setSp(26.0)),
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      feedBack,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                              ScreenUtil.instance.setSp(26.0)),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: ScreenUtil.instance
                                                .setWidth(10.0))),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.grey[350],
                                      size: ScreenUtil.instance.setWidth(40),
                                    )
                                  ],
                                )))
                      ],
                    ),
                  ),
                ),
                DividerLineView(),
                Container(
                  margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
                  width: double.infinity,
                  height: ScreenUtil.instance.setHeight(300.0),
                  child: TextField(
                    controller: _contentController,
                    maxLines: 10,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                    decoration: InputDecoration(
                      hintText: Strings.FEEDBACK_HINT_TEXT,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: ScreenUtil.instance.setWidth(1.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: ScreenUtil.instance.setWidth(1.0)),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          right: ScreenUtil.instance.setWidth(20.0)),
                      child: Text(Strings.FEEDBACK_PHONE_NUMBER,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenUtil.instance.setSp(26.0))),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(26.0)),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: Strings.FEEDBACK_PHONE_NUMBER_HINT_TEXT,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.instance.setSp(26.0)),
                        ),
                      ),
                    )
                  ],
                ),
                DividerLineView(),
                Container(
                  height: ScreenUtil.instance.setHeight(100.0),
                  margin:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(100)),
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(20),
                      right: ScreenUtil.instance.setWidth(20)),
                  child: MaterialButton(
                    color: Colors.deepOrangeAccent,
                    splashColor: Colors.deepOrange,
                    minWidth: double.infinity,
                    onPressed: ()=>_submit(),
                    child: Text(
                      Strings.SUBMIT,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.instance.setSp(30.0)),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }

  _submit() {
    if (feedBack.isEmpty) {
      ToastUtil.showToast(Strings.PLEASE_SELECT_FEEDBACK_TYPE);
      return;
    }
    if (_contentController.text.isEmpty) {
      ToastUtil.showToast(Strings.FEEDBACK_HINT_TEXT);
      return;
    }
    if (_phoneController.text.isEmpty) {
      ToastUtil.showToast(Strings.FEEDBACK_PHONE_NUMBER_HINT_TEXT);
      return;
    }
    var parameters = {
      "content": _contentController.text,
      "feedType": feedBack,
      "hasPicture": "false",
      "mobile": _phoneController.text,
    };
    _mineService.feedback(parameters,  (success) {
      ToastUtil.showToast(Strings.FEEDBACK_SUCCESS);
      Navigator.pop(context);
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  _showFeedBackDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              Strings.PLEASE_SELECT_FEEDBACK_TYPE,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            children: <Widget>[
              SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      feedBack = Strings.FEEDBACK_DYSFUNCTION;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil.instance.setHeight(80.0),
                    child: Text(
                      Strings.FEEDBACK_DYSFUNCTION,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  )),
              DividerLineView(),
              SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      feedBack = Strings.FEEDBACK_SUGGESTIONS_OPTIMIZATION;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil.instance.setHeight(80.0),
                    child: Text(
                      Strings.FEEDBACK_SUGGESTIONS_OPTIMIZATION,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  )),
              DividerLineView(),
              SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      feedBack = Strings.FEEDBACK_OTHER;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil.instance.setHeight(60.0),
                    child: Text(
                      Strings.FEEDBACK_OTHER,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  )),
            ],
          );
        });
  }
}
