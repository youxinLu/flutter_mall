Flutter_Mall
==========

Flutter_Mall是一款Flutter开源在线商城应用程序，是基于[litemall](https://github.com/linlinjava/litemall)基础上进行开发，litemall包含了Spring Boot后端 + Vue管理员前端 + 微信小程序用户前端 + Vue用户移动端感兴趣的同学可以自行研究部署，Flutter_Mall基本上包含了litemall中小程序的功能。<br>

Flutter_Mall_Plus 是在Flutter_Mall的基础上进行重构优化的版本，整体采用了MVVM模式，比Flutter_Mall 无论是UI还是代码可读性、维护性上都有一定的提升，Flutter_Mall已经切换在分支v1.0，以后将不再进行维护。

扫码体验Flutter_Mall_Plus 安卓版本（iOS请自行下载源码进行编译）
----------
Flutter_Mall 已经重构完成，整体采用MVVM，页面上也进行了优化<br>
因蒲公英下载方式改变，现在下载方式改为密码下载，打开网址以后输入密码123456<br>
![扫码下载](https://www.pgyer.com/app/qrcode/FNiG)<br>


Flutter_Mall功能
----------
* 首页<br>
* 专题列表、专题详情<br>
* 分类列表、分类详情<br>
* 品牌列表、品牌详情<br>
* 新品首发、人气推荐<br>
* 优惠券列表、优惠券选择<br>
* 商品搜索<br>
* 商品详情<br>
* 购物车<br>
* 购物下单<br>
* 订单列表、订单详情<br>
* 地址、收藏、足迹、意见反馈<br>

项目截图
------------------
![首页](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-12-38.jpg)
![首页](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-28-45.jpg)<br> 
![分类](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-13-39.jpg)
![分类商品列表](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-13-55.jpg)<br> 
![分类商品列表](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-13-30.jpg)
![购物车](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-17-25.jpg)<br> 
![我的](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-19-37.jpg)
![商品详情](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-14-26.jpg)<br> 
![商品详情](https://github.com/youxinLu/mall/raw/master/screenshots/2020-12-28-08-14-32.jpg)
![下单](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-15-50.jpg)<br> 
![我的收藏](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-20-58.jpg)
![我的订单](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-21-28.jpg)<br> 
![订单详情](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-29-20.jpg)
![地址管理](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-29-31.jpg)<br> 
![添加地址](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-29-40.jpg)
![我的收藏](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/2020-12-28-08-21-52.jpg)
        
项目结构
------------------
lib<br>
>constant(颜色、尺寸、图片、字符串、url、textStyle统一管理)<br>
>event(事件)<br>
>model<br>
>router(路由相关)<br>
>service(网络请求)<br>
>utils(工具类)<br>
>view_model<br>
>ui<br>
>>widget 共用组件<br>
>> page<br>
>>>404<br>
>>>goods(商品相关)<br>
>>>guide(引导页)<br>
>>>home(首页)<br>
>>>login（登录注册相关）<br>
>>>mine（我的）<br>
>page(页面)<br>
>>category(分类)<br>
>>goods(商品)<br>
>>login(登录注册)<br>
>>mine(我的)<br>
>>splash(启动页)<br>


第三方框架
-----------------
| 名称        | 作用         | 
| ------------- |:-------------:| 
|  [flutter_swipe](https://github.com/best-flutter/flutter_swiper)     |轮播图 | 
|  [dio](https://github.com/flutterchina/dio)  | 网络框架      |  
|  [flutter_spinkit](https://github.com/jogboms/flutter_spinkit)   | 旋转组件    |   
|  [event_bus](https://github.com/marcojakob/dart-event-bus)   | 事件通知    |   
|  [flutter_html](https://github.com/Sub6Resources/flutter_html)   | html框架    |   
|  [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)   | 屏幕适配    |   
|  [fluttertoast](https://pub.dev/packages/fluttertoast)   |  Toast   |   
|  [shared_preferences](https://pub.dev/packages/shared_preferences)   | 本地数据缓存    |   
|  [fluro](https://pub.dev/packages/fluro)   |  路由   |   
|  [city_pickers](https://pub.dev/packages/city_pickers)   |  城市选择   |   
|  [pull_to_refresh](https://pub.dev/packages/pull_to_refresh)   |  上拉加载和下拉刷新   |   
|  [flutter_webview_plugin](https://pub.dev/packages/flutter_webview_plugin)   |  webview   |   
|  [cached_network_image](https://pub.dev/packages/cached_network_image)   |  图片缓存   |   
|  [provider](https://pub.dev/packages/provider)   |  状态管理   |   

      

Flutter环境搭建
----------------
[Mac环境搭建](https://blog.csdn.net/zhangxiangliang2/article/details/75566412)<br>
[Windows环境搭建](https://blog.csdn.net/yyanjun/article/details/80682586)

Flutter学习资料
----------------
[Flutter官方文档](https://flutter.io/docs/)<br>
[Flutter中文官网](https://flutter-io.cn/)<br>
[Flutter教程](http://www.flutterj.com/)<br>
[flutter-go](https://github.com/alibaba/flutter-go)<br>
[dart](https://dart.dev/)

赞赏
--------------------
因服务器是由个人维护，如果这个项目对您有帮助，您可以扫描下面二维码进行捐赠，谢谢。<br>

![微信](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/微信图片_20190905142112.jpg)
![支付宝](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/微信图片_20190905142121.jpg)<br> 

联系我
--------------
QQ：443765662<br>
微信<br>
![微信](https://raw.githubusercontent.com/youxinLu/flutter_mall/master/screenshots/QQ截图20190905142302.png)





