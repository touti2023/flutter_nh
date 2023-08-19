import 'package:flutter/material.dart';

import 'contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVO? item;
  final String titleName;
  final Icon icon;

  ContactItem({ this.item,required this.titleName,required this.icon});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFFd9d9d9)
          )
        )
      ),
      height: 52,
        child: ElevatedButton(onPressed: (){ }, child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Text(
                item != null && item?.name != null ? item!.name : titleName, // 注意这里的条件更改
                style: TextStyle(fontSize: 18, color: Color(0xFF353535)),
                maxLines: 1,
              ),
            )
          ],

        )),
    );
  }
}
