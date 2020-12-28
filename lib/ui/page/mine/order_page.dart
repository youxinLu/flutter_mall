import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/ui/page/mine/order_list_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPage extends StatefulWidget {
 final int initIndex;

  OrderPage(this.initIndex);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
     {
  List<String> title = [
    AppStrings.ORDER_ALL,
    AppStrings.TO_BE_PAID,
    AppStrings.TO_BE_DELIVERED,
    AppStrings.TO_BE_RECEIVED,
    AppStrings.TO_BE_EVALUATED,
  ];

  @override
  void initState() {
    super.initState();
    print(widget.initIndex);
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.initIndex,
        length: title.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.MINE_ORDER),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                color: AppColors.COLOR_FFFFFF,
                child: TabBar(
                  tabs: titleBars(),
                  indicatorColor: AppColors.COLOR_FF5722,
                  labelColor: AppColors.COLOR_FF5722,
                  unselectedLabelColor: AppColors.COLOR_999999,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: tabBarViews(),
          ),
        ));
  }

  List<Widget> titleBars() {
    List<Widget> titles = List();
    title.forEach((element) {
      titles.add(Tab(
        child: Text(
          element,
          style: TextStyle(fontSize: ScreenUtil().setSp(AppDimens.DIMENS_36)),
        ),
      ));
    });
    return titles;
  }

  List<Widget> tabBarViews() {
    List<Widget> tabBarViews = List();
    for (int i = 0; i < 5; i++) {
      tabBarViews.add(OrderListPage(showType: i));
    }
    return tabBarViews;
  }
}
