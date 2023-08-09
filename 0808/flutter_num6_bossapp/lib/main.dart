import 'package:flutter/material.dart';
import './splash.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boss直聘',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 0, 215, 198),
      ),
      home: SplashPage()));
}
