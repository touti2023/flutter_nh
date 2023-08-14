import 'package:flutter/material.dart';
import 'package:flutter_num8_xc/pages/home_page.dart';
import 'package:flutter_num8_xc/pages/my_page.dart';
import 'package:flutter_num8_xc/pages/search_page.dart';
import 'package:flutter_num8_xc/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //底部好航蓝文字颜色可更改
        type:BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //默认下的颜色
                color: _defaultColor,
              ),
              //激活下的颜色
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                //默认下的颜色
                color: _defaultColor,
              ),
              //激活下的颜色
              activeIcon: Icon(
                Icons.search,
                color: _activeColor,
              ),
              label: '搜索'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                //默认下的颜色
                color: _defaultColor,
              ),
              //激活下的颜色
              activeIcon: Icon(
                Icons.camera_alt,
                color: _activeColor,
              ),
              label: '旅拍'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                //默认下的颜色
                color: _defaultColor,
              ),
              //激活下的颜色
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              label: '我的'),
        ],
        selectedLabelStyle:
            TextStyle(color: _activeColor, fontSize:15,fontWeight: FontWeight.bold),
        selectedItemColor: _activeColor,
        unselectedItemColor: _defaultColor,
        unselectedLabelStyle: TextStyle(color: _defaultColor,fontSize: 15),
      ),
    );
  }
}
