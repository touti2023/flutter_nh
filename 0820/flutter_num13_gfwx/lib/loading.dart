import 'package:flutter/material.dart';
import 'package:async/async.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed('app');
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/loading.webp'),
    );
  }
}
