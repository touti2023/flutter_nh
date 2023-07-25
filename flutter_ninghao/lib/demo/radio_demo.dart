import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _radioGroupA = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'), // 可以在这里设置 AppBar 的标题
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('RadioGroupValue:$_radioGroupA'),
              SizedBox(
                height: 32.0,
              ),
              RadioListTile(
                value: 0,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged,
                title: Text('Options A'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_1),
                selected: _radioGroupA == 0,
              ),
              RadioListTile(
                value: 1,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged,
                title: Text('Options B'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_2),
                selected: _radioGroupA == 1,
              ),
              // Radio(
              //   value: 0,
              //   groupValue: _radioGroupA,
              //   onChanged: _handleRadioValueChanged,
              //   activeColor: Colors.black,
              // ),
              // Radio(
              //   value: 1,
              //   groupValue: _radioGroupA,
              //   onChanged: _handleRadioValueChanged,
              //   activeColor: Colors.black,
              // ),
            ]),
      ),
    );
  }
}
