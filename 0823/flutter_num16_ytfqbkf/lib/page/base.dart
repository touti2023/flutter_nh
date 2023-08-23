import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../router.dart';
import '../path.dart' as Path;

typedef Widget BuildFn(BuildContext ctx, Map params, NoRoute router);

class BodyPage extends Page {
  BodyPage();
  BuildFn _build;
  bool noAnimate = true;
  String title;
  DateTime _lastPressedAt;

  bottomNavigationBar(ctx, path, NoRoute router){
    var _selectedIndex = -1;
    switch(path){
      case Path.Home:
        _selectedIndex = 0;
        break;
      case Path.Subject:
        _selectedIndex = 1;
        break;
      case Path.User:
        _selectedIndex = 2;
        break;
    }

    if(_selectedIndex == -1) return null;
    const IconData home = IconData(0xe60d, fontFamily: 'Nav');
    const IconData gift = IconData(0xe616, fontFamily: 'Nav');
    const IconData contact = IconData(0xe64a, fontFamily: 'Nav');

    return BottomNavigationBar(
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(gift), title: Text('专题')),
        BottomNavigationBarItem(icon: Icon(contact), title: Text('用户')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepOrange,
      onTap: (index){
        if(_selectedIndex == index)  return;
        switch (index){
          case 0:
            router.to(ctx, Path.Home, {});
            break;
          case 1:
            router.to(ctx, Path.Subject, {});
            break;
          case 2:
            router.to(ctx, Path.User, {});
            break;
        }
      }
    );
  }
  build(Map params, router) {
    if(noAnimate)
    {
      return PageRouteBuilder(
        pageBuilder: (ctx, _, __){
          return Scaffold(
              body: params['init'] ? wrapPopScope(_build(ctx, params, router)) : _build(ctx, params, router),
              bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? "/", router),
//              drawer: layout.drawer(ctx)
          );
        }
      );
   }
   return MaterialPageRoute(builder: (ctx){
     var appBar = this.title != null ?
        AppBar(title: Text(this.title), backgroundColor: Colors.deepOrange, centerTitle: false, elevation: 0,)
         : null;
      return Scaffold(
        appBar: appBar,
        body: params['init'] ? wrapPopScope(_build(ctx, params, router)) : _build(ctx, params, router),
        bottomNavigationBar: bottomNavigationBar(ctx, params["path"] ?? "/", router),
//        drawer: layout.drawer(ctx)
      );
    },
    );
  }

  Widget wrapPopScope(Widget child){
    return WillPopScope(
        onWillPop: () async {
      if (_lastPressedAt == null ||
          DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
        Fluttertoast.showToast(
          msg: "再次返回退出应用",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        return false; // 不退出
      }
      
      return true; // 退出
    },
    child: child,);
  }

  BodyPage.formBuild(BuildFn build, {this.noAnimate = true, this.title}) {
    _build = build;
  }


}
