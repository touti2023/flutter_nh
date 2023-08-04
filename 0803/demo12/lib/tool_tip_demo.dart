import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Tooltip(
          message: '不要碰我，我有刺',
          child: Image.network(
            'https://img0.baidu.com/it/u=1049128848,3061718195&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
