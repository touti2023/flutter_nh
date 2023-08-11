import 'package:flutter/material.dart';

Color? primaryColor = Colors.blue[600];

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String _firstLagnuage = '英语';
  String _secondLanguage = '中文（简体）';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this._firstLagnuage,
                      style: TextStyle(color: primaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.compare_arrows),
              color: primaryColor,
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this._secondLanguage,
                      style: TextStyle(color: primaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
