import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({Key? key}) : super(key: key);

  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: Counter(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCount,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}
