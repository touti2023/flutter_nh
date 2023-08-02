import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);

  @override
  State<EachView> createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}
