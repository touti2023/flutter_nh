import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_demo01/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _t;

  @override
  void initState() {
    _t = Timer(const Duration(milliseconds: 1500), () {
      try {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => BossApp()));
      } catch (e) {
        print(e);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Text(
              'Boss直聘',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
