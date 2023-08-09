import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
                  text: '敬请期待',
                  style: TextStyle(fontSize: 16, color: Colors.black)))
        ],
      ),
    );
  }
}
