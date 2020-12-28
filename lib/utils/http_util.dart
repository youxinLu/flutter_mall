import 'package:dio/dio.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/router/application.dart';
import 'package:mall/router/routers.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/shared_preferences_util.dart';

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();
  static HttpUtil _httpUtil;
  var dio;

  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  HttpUtil() {
    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    dio = new Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("========================请求数据===================");
      print("url=${options.uri.toString()}");
      print("params=${options.data}");
      dio.lock();
      //如果token存在在请求头加上token

      await SharedPreferencesUtil.getInstance()
          .getString(AppStrings.TOKEN)
          .then((token) {
        options.headers[AppStrings.TOKEN] = token;
        print("token=${token}");
      });
      dio.unlock();
      return options;
    }, onResponse: (Response response) {
      print("========================请求数据===================");
      print("code=${response.statusCode}");
      print("response=${response.data}");
      if (response.data[AppStrings.ERR_NO] == 501) {
        Application.navigatorKey.currentState.pushNamed(Routers.login);
        dio.reject("");
      }
      return response;
    }, onError: (DioError error) {
      print("========================请求错误===================");
      print("message =${error.message}");
      return error;
    }));
  }

  //get请求
  Future get(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response =
          await dio.get(url, queryParameters: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.get(url, queryParameters: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  //post请求
  Future post(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    return response.data;
  }
}
