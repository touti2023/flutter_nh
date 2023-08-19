import 'package:flutter/material.dart';
import './contact_item.dart';

class ContactHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactItem(titleName:'新的朋友',icon:Icon(Icons.face), ),
        ContactItem(titleName:'群聊',icon:Icon(Icons.group), ),
        ContactItem(titleName:'公众号',icon:Icon(Icons.padding_rounded), ),
      ],
    );
  }
}
