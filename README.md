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
![首页](https://bj29.cn-beijing.data.alicloudccp.com/5fea78670b860c18158947feb63f9a0c5134e934%2F5fea786787964ec1ee524048a9d4224a0a391a9b?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203647&x-oss-process=image%2Fresize%2Cw_1920%2Fformat%2Cjpeg&x-oss-signature=lZwLi2HqcuWQ2Ar8NGf7YeR23SpRTsmTcsavGdLxBPI%3D&x-oss-signature-version=OSS2)
![首页](https://bj29.cn-beijing.data.alicloudccp.com/5fea78cd843be439be2e456dadcca92f2fedb50c%2F5fea78cd5a457c241d5e4a82beed78c7106ceae7?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609202769&x-oss-signature=xfvX0sVvWpP3nTjmmic%2Beb01EczCvL5cGsU54y7kqg0%3D&x-oss-signature-version=OSS2)<br> 
![分类](https://bj29.cn-beijing.data.alicloudccp.com/5fea78f6dd93b4bf6d304d7a926a674e03c906cc%2F5fea78f6ca13e4f8f59643a68857df6e716384c2?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609202811&x-oss-signature=FJTSEDnB0oMCEFcPTZOhyd0mWW8ZVqb5M8Nc%2FsVhAzA%3D&x-oss-signature-version=OSS2)
![分类商品列表](https://bj29.cn-beijing.data.alicloudccp.com/5fea791d2ab37d3e98044bbcb58d2e9448c56e23%2F5fea791da7db0ac85a5e44a589b85166b1b10b43?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609202849&x-oss-signature=6VTLN3XcvzvVR5YviCcNWqDDWMPC3zKIGkU71LcsnLQ%3D&x-oss-signature-version=OSS2)<br> 
![分类商品列表](https://bj29.cn-beijing.data.alicloudccp.com/5fea7993803196c6ea06478084a53e186c0a1f4b%2F5fea79937e81a99b356347b08a0a38143d248bd3?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609202967&x-oss-signature=H0rm7H5UPVQIPYXIPKmQEPb2muA4iKrwwLXh8BNJ9%2Bs%3D&x-oss-signature-version=OSS2)
![购物车](https://bj29.cn-beijing.data.alicloudccp.com/5fea794b97083893b6144d68af8d9ac60618f8c0%2F5fea794b4ab0360167ed494da2376a4db93664ad?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609202895&x-oss-signature=S42A2s10iL%2FWAPQethkZGyqwjnYZjmx6kIgJFQtO6zk%3D&x-oss-signature-version=OSS2)<br> 
![我的](https://bj29.cn-beijing.data.alicloudccp.com/5fea79699a54219abb804b67990109904abf79b7%2F5fea7969e33fc1ad026c4fa2a367b9c756e23f97?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609202925&x-oss-signature=3GWWfa9WHls0wOKBx6xZ02%2FyMA26ios4YpRiD489iwc%3D&x-oss-signature-version=OSS2)
![商品详情](https://bj29.cn-beijing.data.alicloudccp.com/5fea79d04b65e29035704d1e88535ee0bf772d84%2F5fea79d0cd3ff657c4dc47269de87a9d8cdbe4b0?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203029&x-oss-signature=MM4tmBgBLvyAvVCEqqtl0AzQjW1xpcB%2FVJhEMHWt1LA%3D&x-oss-signature-version=OSS2)<br> 
![商品详情](https://bj29.cn-beijing.data.alicloudccp.com/5fea79d3f106eaaf62964a30b9e000dfcb32d9c2%2F5fea79d37b3eb832cb5c41ba865562b8e9db15c9?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203032&x-oss-signature=o7Xwvxl8a0AYkxMeq61gtP7r8BdtnzKJ%2FDHyFcLe6l8%3D&x-oss-signature-version=OSS2)
![下单](https://bj29.cn-beijing.data.alicloudccp.com/5fea7a75bc11203bb74a4aae8fbcdc35ab84ea88%2F5fea7a754d5bb5cb4f0e4465a376dacb7c2889f6?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203194&x-oss-signature=X5nVh3L9WtDnvr8C%2Fdcw676ihK8EYlTSAmBqPMmYb%2Fg%3D&x-oss-signature-version=OSS2) <br> 
![我的收藏](https://bj29.cn-beijing.data.alicloudccp.com/5fea7abc8ea6c8834df04fcd8cc89c70534affde%2F5fea7abc43d09cf6c0854209963a08d7f26496fc?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203265&x-oss-signature=b4fkbddu7QM0tfnBRYDN%2BCMYGs8GUY%2B38Tj7XuMNlYA%3D&x-oss-signature-version=OSS2)
![我的订单](https://bj29.cn-beijing.data.alicloudccp.com/5fea7ae36b0f4a6aca874170ae47dfd9a1df2e02%2F5fea7ae322b4dccfc27249f78eacde7287ed1959?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203303&x-oss-signature=PUjmLS9z6QOgL%2BknNtBlKnqSWg6a%2BkIqB89Y7A3jfOU%3D&x-oss-signature-version=OSS2)<br> 
![订单详情](https://bj29.cn-beijing.data.alicloudccp.com/5fea7b7731d56f2be7744dde80bfbce8d09b8995%2F5fea7b7720d0cd2896634509949ee13583d485ed?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203451&x-oss-signature=%2B173saxBdg8btYlsvGl%2FT%2B3h1fT20bm0Wtj%2FDv1eLxc%3D&x-oss-signature-version=OSS2)
![地址管理](https://bj29.cn-beijing.data.alicloudccp.com/5fea7b04bd40651c4a4d4d4eb7d7e7fd12e2342e%2F5fea7b0414ca9cca5041417494de6f2acdc8531e?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203337&x-oss-signature=vwN%2FkmGEX8YMrManUemzXHdK5x3n%2B7%2F4enGN2OgT7FE%3D&x-oss-signature-version=OSS2)<br> 
![添加地址](https://bj29.cn-beijing.data.alicloudccp.com/5fea7b072a1428cf1bbe4f4fa3c3e593dd84fd82%2F5fea7b07d9b802e7bec1487091e0116639a2b7b2?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203340&x-oss-signature=apwnWUyWOZ3FNaBuXNHHHUVkd541rtyZKXDZlEJqYmg%3D&x-oss-signature-version=OSS2)
![我的收藏](https://bj29.cn-beijing.data.alicloudccp.com/5fea7b43cb72dbefa1ed4b998de8563b7ea53668%2F5fea7b43d3f34037814648d3b6f71e60deaf5abd?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609203399&x-oss-signature=4m%2BOpxYwOAwTJlnVYNiywHrQ42KIIrDFYhk5EFu%2FyJM%3D&x-oss-signature-version=OSS2)<br> 

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

![微信](https://bj29.cn-beijing.data.alicloudccp.com/5fe92931d111986af709492a8b69268312b4607e%2F5fe9293121f9571a18964022a81e73a88569e6b4?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609117036&x-oss-process=image%2Fresize%2Cw_1920%2Fformat%2Cjpeg&x-oss-signature=%2BDNu3Jv3mWp%2FwP4on%2FrG4hIKXzs4%2FAeRYXf7gtlQLhk%3D&x-oss-signature-version=OSS2)
![支付宝](https://bj29.cn-beijing.data.alicloudccp.com/5fe929315201ad437c064613a69a34f2ffa9d228%2F5fe92931aa94e7c068cf40e19dbd931b0f741478?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609117036&x-oss-process=image%2Fresize%2Cw_1920%2Fformat%2Cjpeg&x-oss-signature=rIMjLo6ThbVejAAPZG5oYEX%2BsXDL31fX%2BjG8dPDotMI%3D&x-oss-signature-version=OSS2)<br> 

联系我
--------------
QQ：443765662<br>
微信<br>
![微信](https://bj29.cn-beijing.data.alicloudccp.com/5fe9292fb9afa6123fc543fba989665f61ec0ae5%2F5fe9292fc83aee8df95d428b8215100abf604644?x-oss-access-key-id=LTAIsE5mAn2F493Q&x-oss-expires=1609117036&x-oss-process=image%2Fresize%2Cw_1920%2Fformat%2Cjpeg&x-oss-signature=vFVGKBbqmxaARwHakoOkia9am3QFyJEH0hu48SMEOeo%3D&x-oss-signature-version=OSS2)

注意
--------
该项目仅用于个人学习使用，如将此项目用于商业行为，请与我取得联系，否则将保留追诉权。



