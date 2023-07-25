import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _siderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliderDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: _siderItemA,
                  onChanged: (value) {
                    setState(() {
                      _siderItemA = value;
                    });
                  },
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,
                  label: '${_siderItemA.toInt()}',
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('ラブパワー:$_siderItemA')
          ],
        ),
      ),
    );
  }
}
