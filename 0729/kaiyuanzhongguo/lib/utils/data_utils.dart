import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';

class DataUtils {
  static const String SP_ACCESS_TOKEN = 'access_token';
  static const String SP_REFRESH_TOKEN = 'refresh_token';
  static const String SP_UID = 'uid';
  static const String SP_TOKEN_TYPE = 'token_type';
  static const String SP_EXPRIRES_IN = 'exprires_in';
  static const String SP_IS_LOGIN = 'is_login';
  //
  static Future<void> saveLoginInfo(Map<String, dynamic> map) async {
    if (map != null && map.isNotEmpty) {
      //保存token等信息
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp
        ..setString(SP_ACCESS_TOKEN, map[SP_ACCESS_TOKEN])
        ..setString(SP_REFRESH_TOKEN, map[SP_REFRESH_TOKEN])
        ..setString(SP_UID, map[SP_UID])
        ..setString(SP_TOKEN_TYPE, map[SP_TOKEN_TYPE])
        ..setString(SP_EXPRIRES_IN, map[SP_EXPRIRES_IN])
        ..setBool(SP_IS_LOGIN, true);
    }
  }

  //
  static Future<void> clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp
      ..setString(SP_ACCESS_TOKEN, '')
      ..setString(SP_REFRESH_TOKEN, '')
      ..setInt(SP_UID, -1)
      ..setString(SP_TOKEN_TYPE, '')
      ..setInt(SP_EXPRIRES_IN, -1)
      ..setBool(SP_IS_LOGIN, false);
  }

  //是否登陆
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool(SP_IS_LOGIN);
    return isLogin != null && isLogin;
  }

  //获取token
  static Future<String?> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_ACCESS_TOKEN);
  }
}
