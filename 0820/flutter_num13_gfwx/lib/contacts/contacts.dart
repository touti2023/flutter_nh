import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_sider_list.dart';
import './contact_header.dart';
import './contact_vo.dart';
import './contact_item.dart';


class Contacts extends StatefulWidget {


  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
          items: contactData, headerBuilder: (context,index){
            return Container(
              child: ContactHeader(),
            );
      }, itemBuilder: (context,index){
            return Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: ContactItem(item:contactData[index], titleName: 'o', icon: Icon(Icons.access_alarms_outlined)),
            );
    },
          sectionBuilder: (context,index){
            return Container(
              height: 32,
              padding: EdgeInsets.only(left: 14),
              color: Colors.grey[300],
              alignment: Alignment.centerLeft
              ,
              child: Text(contactData[index].seationKey,
              style: TextStyle(fontSize: 14,color: Color(0xff909090)),),
            )
            ;
          }),
    );
  }
}
