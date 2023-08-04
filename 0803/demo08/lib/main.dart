import 'package:flutter/material.dart';
import 'expansion_tile_demo.dart';
import './expansion_panel_list.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData.dark(),
      //home: ExpansionTileDemo(),
      home: ExpansionPanelListDemo(),
    );
  }
}
