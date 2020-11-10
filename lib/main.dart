import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:mall/config/routers.dart';
import 'package:mall/config/application.dart';
import 'package:mall/model/user_info.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    builder: (context) => UserInfoModel(),
    child: MallApp(),
  ));
}

class MallApp extends StatelessWidget {
  MallApp() {
    final router = FluroRouter();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,

      ),
    );
  }
}
