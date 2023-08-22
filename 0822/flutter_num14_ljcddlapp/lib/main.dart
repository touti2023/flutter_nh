import 'package:flutter/material.dart';
import 'package:flutter_num14_ljcddlapp/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app.dart';

void  main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flutter 企业实战',
  theme: mDefaultTheme,
  routes: <String,WidgetBuilder>{
    'app':(BuildContext context)=> App(),
  //   'company_info':(BuildContext context)=>Scaffold(
  //     appBar:AppBar(
  //       title: Text('公司介绍'),
  //       leading: IconButton(onPressed: (){
  //         Navigator.of(context).pushNamed('app');
  //       }, icon: Icon(Icons.home)),
  //     ),
  //     body:WebView(
  //       initialUrl:'www/baidu.com',
  //       javascriptMode:JavaScriptMode.unrestricted,
  //     ),
  //   ),
  },
  home: LoadingPage(),
  ),
);

//自定义主题
final ThemeData mDefaultTheme = ThemeData(
  primarySwatch: Colors.red
);



























//调试接口用
// import 'package:http/http.dart'as http;
// import 'dart:convert';
//
// void main() {
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//
//           title: Text('title'),
//         ),
//         body: Center(
//           child: ElevatedButton(onPressed: () async{
//             String url = 'http://10.0.2.2:8080/?action=getNews';
//
//             var res = await http.get(Uri.parse(url));
//             String body=res.body;
//
//             print(body);
//
//             var json=jsonDecode(body);
//           },
//               child: Text('测试数据接口')),
//         ),
//       ),
//     );
//   }
// }