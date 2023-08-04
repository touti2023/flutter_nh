import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  //1.定义一个底部导航栏数组
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '分类'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '会员中心'),
  ];

  //2.定义一个数组，调用4个事先创建好的底部页面
  final List tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  //3.建立底部页面索引
  int currentIndex = 0;
  //4.定义一个索引对应的页面属性
  var currentPage;

  //初始化，将索引对应页面初始化设置为 tabBodies 数组索引0的页面（currentIndex=0）
  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        //底部栏4个分类以上，均摊占据
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        //分类的数组
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            //将索引赋值给 当前索引 currentIndex
            currentIndex = index;
            //将页面转换为对应 当前数组的索引 currentIndex
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
