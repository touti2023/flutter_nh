import 'package:flutter/material.dart';
import 'package:flutter_num5_shop/pages/index_page.dart';
import 'package:provider/provider.dart';
import './provider/counter.dart';
import './provider/child_category.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Counter(),
      ),
      ChangeNotifierProvider(
        create: (context) => ChildCategory(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //小技巧：凡事先用Container（），好改。
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '百姓生活+',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}

//中间的横幅
class AdBanner extends StatelessWidget {
  late final String adPicture;

  AdBanner(String adPicture);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}
