import 'package:flutter/material.dart';

import 'bottom_appBar_demo.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //自定义主题样本
      theme: ThemeData(primaryColor: Colors.blue[200]),
      home: BottomAppBarDemo(),
    );
  }
}
