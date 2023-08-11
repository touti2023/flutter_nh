import 'package:flutter/material.dart';
import 'icondemo_page.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(0),
      child: Container(
        height: 220,
        child: Column(
          children: [
            TextDemo(),
            IconDemo(),
          ],
        ),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 18, right: 18, bottom: 20),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '点按即可输入文本',
          ),
          style: TextStyle(color: Colors.black, fontSize: 18),
          maxLines: 999,
          cursorColor: Colors.grey[500],
          cursorWidth: 2,
        ),
      ),
    );
  }
}
