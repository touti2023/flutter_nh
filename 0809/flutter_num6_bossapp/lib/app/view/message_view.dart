import 'package:flutter/material.dart';
import '../item/messagelist_item.dart';
import '../model/message.dart';

class MessageTab extends StatefulWidget {
  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  List<Message> _messages = [];

  @override
  void initState() {
    getMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 215, 198),
        title: Text(
          'Android',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: _messages.length, itemBuilder: buildMessageItem),
    );
  }

  Widget buildMessageItem(BuildContext context, int index) {
    Message message = _messages[index];

    var messageItem = InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(
                    ' 敬请期待!',
                    style: TextStyle(fontSize: 20),
                  ),
                ));
      },
      child: MessageListItem(message),
    );
    return messageItem;
  }

  void getMessageList() {
    setState(() {
      _messages = Message.fromJson("""
{
  "list":[
    {
      "name":"小可爱",
      "avatar":"https://img1.baidu.com/it/u=2833380258,3559070975&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "company":"百度",
      "position":"HR",
      "msg":"您好，你已经落选了，祝你幸福！"
      
    }
   
  ]
}""");
    });
  }
}
