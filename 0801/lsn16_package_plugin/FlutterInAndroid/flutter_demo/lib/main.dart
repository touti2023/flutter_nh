import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(selectWidget(window.defaultRouteName));

Widget selectWidget(String routeName) {
  switch (routeName) {
    case 'r1':
      return MyFlutterView();
    case 'r2':
      return MyFlutterFragment();
    default:
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text('路由不存在！'),
          ),
        ),
      );
  }
} //r1

class MyFlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Card(
            color: Color(0xffff0000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Center(
              child: Text(
                'My Flutter View',
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyFlutterFragment extends StatefulWidget {
  @override
  _MyFlutterFragmentState createState() => _MyFlutterFragmentState();
}

class _MyFlutterFragmentState extends State<MyFlutterFragment> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Card(
            color: Color(0xff0000ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Center(
              child: Text(
                'My Flutter Fragment: $_count',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),),
      ),
    );
  }
}
