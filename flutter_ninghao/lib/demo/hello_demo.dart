import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 40.0,
            //粗体
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
