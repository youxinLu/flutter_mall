import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatefulWidget {
  Future future;
  Widget loadingWidget;
  Widget errorWidget;
  Widget resultWidget;

  FutureBuilderWidget(
      this.future, this.loadingWidget, this.errorWidget, this.resultWidget);

  @override
  _FutureBuilderWidgetState createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
        switch (asyncSnapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return widget.loadingWidget;
          case ConnectionState.done:
            if (asyncSnapshot.hasError) {
              return widget.errorWidget;
            }else {
              return widget.resultWidget;
            }
        }
      },
    );
  }
}
