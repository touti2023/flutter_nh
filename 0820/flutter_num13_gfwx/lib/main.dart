import 'package:flutter/material.dart';
import 'package:flutter_num13_gfwx/search.dart';
import './app.dart';
import './loading.dart';
import 'package:webview_flutter/webview_flutter.dart';


main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'wechat',
    theme: mDefaultTheme,
    routes: <String,WidgetBuilder>{
      'app':(BuildContext context)=> App(),
      'search':(BuildContext context)=> Search(),

      '/friends':(_)=> Scaffold(

        appBar:AppBar(
          title: Text('微信朋友圈'),
        ),
      )
    },
    home: LoadingPage(),
  ));
}


//主题色
final ThemeData mDefaultTheme=ThemeData(
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f)
);