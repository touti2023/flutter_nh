abstract class AppColors {
  // ignore: constant_identifier_names
  static const App_THEME = 0xff63ca6c;
}

abstract class AppInfos {
  static const String CLIENT_ID = '6i4Yu6IUqXnR64em0rsJ'; //id
  static const String CLIENT_SECRET = 'Pb9t3pr'; //密钥
  static const String REDIRECT_URI = 'https://www.baidu.com/';
}

abstract class AppUrls {
  static const String HOST = 'https://www.oschina.net';
  //授权登录
  static const String OAUTH2_AUTHORIZE = HOST + '/action/oauth2/authorize';
  //获取token
  static const String OAUTH2_TOKEN = HOST + '/action/openapi/token';
  //获取用户信息
  static const String OPENAPI_USER = HOST + 'action/openapi/user';
  static const String MY_INFORMATION = HOST + 'action/openapi/my_informat';
  static const String MESSAGE_LIST = HOST + 'action/openapi/message_list';
}
