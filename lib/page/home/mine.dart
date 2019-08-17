import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/widgets/icon_text_arrow.dart';
import 'package:mall/widgets/mall_icon.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:provider/provider.dart';
import 'package:mall/model/user_info.dart';
import 'package:mall/page/mine/address.dart';

class MineView extends StatefulWidget {
  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  bool isLogin = false;
  var imageHeadUrl;
  var nickName;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getToken().then((token) {
      if (token != null) {
        setState(() {
          isLogin = true;
        });
        _getUserInfo();
      }
    });
  }

  _getUserInfo() {
    SharedPreferencesUtils.getImageHead().then((imageHeadAddress) {
      setState(() {
        imageHeadUrl = imageHeadAddress;
      });
    });
    SharedPreferencesUtils.getUserName().then((name) {
      setState(() {
        nickName = name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(160.0),
            width: double.infinity,
            color: Colors.deepOrangeAccent,
            alignment: Alignment.center,
            child: Consumer<UserInfoModel>(
                builder: (context, userInfoModel, child) {
              if ((userInfoModel != null && userInfoModel.userEntity != null)) {
                isLogin = true;
                imageHeadUrl = userInfoModel.userEntity.userInfo.avatarUrl;
                nickName = userInfoModel.userEntity.userInfo.nickName;
                print("MineView UserInfoModel");
              }
              return isLogin
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(100),
                          height: ScreenUtil.getInstance().setHeight(100),
                          margin: EdgeInsets.only(
                              left: ScreenUtil.getInstance().setWidth(30.0)),
                          child: CircleAvatar(
                            radius: ScreenUtil.getInstance().setWidth(50),
                            foregroundColor: Colors.deepOrangeAccent,
                            backgroundImage: NetworkImage(
                              imageHeadUrl,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.getInstance().setWidth(10.0)),
                        ),
                        Text(
                          nickName,
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(26.0),
                              color: Colors.white),
                        )
                      ],
                    )
                  : InkWell(
                      onTap: () => _toLogin(),
                      child: Text(
                        Strings.CLICK_LOGIN,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.getInstance().setSp(30.0)),
                      ),
                    );
            }),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(20.0)),
          ),
          IconTextArrowView(
              MallIcon.ORDER, Strings.ORDER, Colors.deepPurpleAccent, () {}),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              MallIcon.COUPON, Strings.COUPON, Colors.green, mineCoupon),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              MallIcon.COLLECTION, Strings.COLLECTION, Colors.red, collect),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              MallIcon.ADDRESS, Strings.ADDRESS, Colors.amber, address),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              MallIcon.FOOTPRINT, Strings.FOOTPRINT, Colors.pink, footprint),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(MallIcon.FEED_BACK, Strings.FEED_BACK,
              Colors.blueAccent, feedbackCallback),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              MallIcon.ABOUT_US, Strings.ABOUT_US, Colors.teal, aboutUs),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
        ],
      ),
    );
  }

  void feedbackCallback() {
    NavigatorUtils.goFeedback(context);
  }

  void mineCoupon() {
    NavigatorUtils.goCoupon(context);
  }

  void footprint() {
    NavigatorUtils.goFootprint(context);
  }

  void collect() {
    NavigatorUtils.goCollect(context);
  }

  void address() {
    NavigatorUtils.goAddress(context);
  }

  void aboutUs() {
    NavigatorUtils.goAboutUs(context);
  }

  _toLogin() {
    NavigatorUtils.goLogin(context);
  }
}
