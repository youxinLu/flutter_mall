import 'package:shared_preferences/shared_preferences.dart';
import 'package:mall/constant/string.dart';

class SharedPreferencesUtils {
  static Future getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(Strings.TOKEN) ?? null;
  }

  static Future getImageHead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(Strings.HEAD_URL);
  }

  static Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(Strings.NICK_NAME);
  }
}
