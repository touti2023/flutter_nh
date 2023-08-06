import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';

class MemberPage extends StatelessWidget {
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
