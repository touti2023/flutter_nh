import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.green, // 在这里设定新的主色为绿色
                ),
              ),
              child: CheckboxListTile(
                value: _checkboxItemA,
                onChanged: (value) {
                  setState(() {
                    _checkboxItemA = value!;
                  });
                },
                title: Text('Checkbox Item A'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.bookmark),
                selected: _checkboxItemA,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Checkbox(
                //   value: _checkboxItemA,
                //   onChanged: (v) {
                //     setState(() {
                //       _checkboxItemA = v!;
                //     });
                //   },
                //   activeColor: Colors.black,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
