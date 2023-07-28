import 'package:flutter/material.dart';
import 'package:kaiyuanzhongguo/constants/constants.dart';
import 'package:kaiyuanzhongguo/widgerts/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ['资讯', '动弹', '发现', '我的'];
  var _currentIndex = 0;
  // ignore: non_constant_identifier_names
  late List _Pages = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.deepOrange,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(AppColors.App_THEME),
          title: Text(
            _appBarTitle[_currentIndex],
            style: TextStyle(color: Colors.white),
          ),
          elevation: 2.0,
        ),
        body: PageView.builder(
          itemBuilder: (BuildContext context, index) {
            return _Pages[index];
          },
          controller: _pageController,
          itemCount: _Pages.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.pink,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.earbuds),
              label: '资讯',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '动弹',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.yard_sharp),
              label: '发现',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.landscape),
              label: '我的',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 300),
                curve: Curves.bounceInOut);
          },
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
