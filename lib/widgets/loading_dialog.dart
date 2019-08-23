import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatefulWidget {
  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitFoldingCube(
          size: ScreenUtil.instance.setWidth(60.0),
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
