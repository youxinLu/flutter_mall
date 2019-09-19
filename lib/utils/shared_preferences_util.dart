import 'package:shared_preferences/shared_preferences.dart';
import 'package:mall/constant/string.dart';

class SharedPreferencesUtils {
  static String token = "";

  static Future getToken() async {
    if (token == null || token.isEmpty) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Strings.TOKEN) ?? null;
    }
    return token;
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
