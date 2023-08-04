import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('首页'),
      ),
      body: Center(
        child: Text('我是首页，你好啊！'),
      ),
    );
  }
}
