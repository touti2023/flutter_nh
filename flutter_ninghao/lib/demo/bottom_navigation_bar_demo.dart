import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  const BottomNavigationBarDemo({super.key});

  @override
  State<BottomNavigationBarDemo> createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currnetIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      _currnetIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        //下导航栏索引
        currentIndex: _currnetIndex,
        onTap: _onTapHandler,
        //下导航栏超过4个按钮时，调整布局
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        //下导航栏
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: ("Explore"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: ("History"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: ("List"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ("My"),
          ),
        ]);
  }
}
