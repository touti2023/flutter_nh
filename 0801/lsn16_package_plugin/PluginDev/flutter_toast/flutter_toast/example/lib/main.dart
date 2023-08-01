import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_toast/flutter_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Toast Plugin Demo'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              print('吐司');
              FlutterToast.showToast(
                'Hello Damon!',
                duration: 'short',
                textColor: 0xffff0000,
                textSize: 20.0,
              );
            },
            child: Text('ShowToast'),
          ),
        ),
      ),
    );
  }
}
