import 'package:flutter/material.dart';
import '../model/message.dart';

class MessageListItem extends StatelessWidget {
  final Message message;

  MessageListItem(this.message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            elevation: 0.0,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 15,
                    left: 15,
                    bottom: 0,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(message.avatar),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        message.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 5, left: 0, right: 5, bottom: 5),
                      child: Text(
                        message.company + " | " + message.position,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 0, right: 5, bottom: 10),
                      child: Text(
                        message.msg,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}
