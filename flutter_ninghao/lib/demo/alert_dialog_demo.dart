import 'package:flutter/material.dart';

enum Action { Ok, Cancel }

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog(
        context: context,
        //点空白不能关闭对话框，必须选择
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure about this?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, Action.Cancel);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, Action.Ok);
                },
                child: Text('Ok'),
              ),
            ],
          );
        });

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your choice is:$_choice'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: () => _openAlertDialog(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
