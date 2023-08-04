import 'package:flutter/cupertino.dart';

class RigthBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => RigthBackDemo(),
                ));
              },
              child: Icon(CupertinoIcons.add)),
        ),
      ),
    );
  }
}
