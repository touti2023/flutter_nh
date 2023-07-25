import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxdartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxdartDemo'),
        elevation: 0.0,
      ),
      body: RxdartDemoHome(),
    );
  }
}

class RxdartDemoHome extends StatefulWidget {
  @override
  _RxdartDemoHomeState createState() => _RxdartDemoHomeState();
}

class _RxdartDemoHomeState extends State<RxdartDemoHome> {
  // @override
  // void initState() {
  //   super.initState();
  //   Stream<String> _stream = Stream.fromIterable(['hello', 'ni hao']);

  //   _stream.listen(print);
  // }

  PublishSubject<String> _subject = PublishSubject<String>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
