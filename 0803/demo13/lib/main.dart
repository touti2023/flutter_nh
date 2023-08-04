import 'package:flutter/material.dart';

import 'draggable_demo.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData.light(),
      home: DraggableDemo(),
    );
  }
}
