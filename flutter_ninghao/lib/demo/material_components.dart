import 'package:flutter/material.dart';
import '../demo/form_demo.dart';
import './checkbox_demo.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'Checkbox', page: CheckboxDemo()),
        ],
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        elevation: 0.0,
        backgroundColor: Colors.black87,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
