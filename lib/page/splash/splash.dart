import 'package:flutter/material.dart';
import 'package:mall/utils/navigator_util.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      NavigatorUtils.goMallMainPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrangeAccent,
        child: Image.asset(
          "images/splash.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
