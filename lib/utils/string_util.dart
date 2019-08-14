import 'dart:convert';

class StringUtils {
  static String encode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  static String decode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
