import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: KeepAliveDemo(),
    );
  }
}

class KeepAliveDemo extends StatefulWidget {
  const KeepAliveDemo({super.key});

  @override
  State<KeepAliveDemo> createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Keep Alive Demo'),
        bottom: TabBar(controller: _controller, tabs: [
          Tab(
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            icon: Icon(Icons.directions_bike),
          ),
          Tab(
            icon: Icon(Icons.directions_train),
          ),
        ]),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        MyHomePage(),
        MyHomePage(),
        MyHomePage(),
      ]),
    );
  }
}
