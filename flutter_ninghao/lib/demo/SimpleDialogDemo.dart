import 'package:flutter/material.dart';
import '';

//枚举3个选项
enum Option { A, B, C }

class SimpleDialogDemo extends StatefulWidget {
  @override
  State<SimpleDialogDemo> createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';
  //异步
  Future _openSimpleDialog() async {
    //显示对话框
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            //选项
            children: [
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () => Navigator.pop(context, Option.A),
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () => Navigator.pop(context, Option.B),
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () => Navigator.pop(context, Option.C),
              ),
            ],
          );
        });

    switch (option) {
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;

      case Option.B:
        setState(() {
          _choice = 'B';
        });

        break;

      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    //显示对话框
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your choice is: $_choice'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _openSimpleDialog,
                    child: Icon(Icons.format_list_numbered),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
