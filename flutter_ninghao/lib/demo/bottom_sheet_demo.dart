import 'package:flutter/material.dart';
import 'package:ninghao_13kara/demo/SimpleDialogDemo.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        ?.showBottomSheet((BuildContext context) => BottomAppBar(
              child: Container(
                height: 90.0,
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Row(children: [
                  Icon(Icons.pause_circle_outline),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text('01:30/ 03:30'),
                  Expanded(
                      child: Text(
                    'Fix you - Coldplay',
                    textAlign: TextAlign.right,
                  ))
                ]),
              ),
            ));
  }

  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        });

    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: const Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _openBottomSheet,
                  child: Text('Open BottomSheet'),
                ),
                ElevatedButton(
                  onPressed: _openModalBottomSheet,
                  child: Text('Modal BottomSheet'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
