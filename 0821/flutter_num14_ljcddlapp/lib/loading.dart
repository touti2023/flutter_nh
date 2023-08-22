import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {


  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    //3s
    Future.delayed(Duration(seconds: 2),(){
      print('Flutter企业站启动...');
      Navigator.of(context).pushNamed('app');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(

      child: Stack(

        children: [
          Image.network('https://img0.baidu.com/it/u=1524324013,384632003&fm=253&fmt=auto&app=138&f=JPEG?w=281&h=500',
         ),

          Center(
            child: Text('FLutter企业站',style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              decoration: TextDecoration.none
            ),),
          ),
        ],
      ),
    );
  }
}

