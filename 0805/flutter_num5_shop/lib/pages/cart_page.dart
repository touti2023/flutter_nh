import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Column(
          children: [
            Number(),
            MyButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<Counter>().increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = context.watch<Counter>();
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Text(
        'Counter: ${counter.count}',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Increment"),
      onPressed: context.read<Counter>().increment,
    );
  }
}
