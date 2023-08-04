import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('Tile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: [
            ListTile(
              title: Text('list tile'),
              subtitle: Text('222'),
            ),
          ],
          // initiallyExpanded: true,
        ),
      ),
    );
  }
}
