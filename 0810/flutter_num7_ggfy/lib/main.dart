import 'package:flutter/material.dart';

import 'animation/open_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Translate',
        theme: ThemeData(
          primaryColor: Colors.blue[600],
          primarySwatch: Colors.blue,
        ),
        home: OpenAnimation(),
      ),
    ));
  }
}
