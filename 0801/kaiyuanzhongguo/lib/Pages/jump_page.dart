import 'package:flutter/material.dart';

class JumpPage extends StatelessWidget {
  final String title;

  JumpPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
    );
  }
}
