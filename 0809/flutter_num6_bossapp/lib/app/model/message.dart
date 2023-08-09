import 'dart:convert';

//数据模型
class Message {
  final String name;
  final String avatar;
  final String company;
  final String position;
  final String msg;

  Message({
    required this.name,
    required this.avatar,
    required this.company,
    required this.position,
    required this.msg,
  });

  //数据转换

  static List<Message> fromJson(String jsonStr) {
    List<Message> _msgs = [];

    var mapData = json.decode(jsonStr)['list'];

    for (var obj in mapData) {
      _msgs.add(Message(
        name: obj['name'],
        avatar: obj['avatar'],
        company: obj['company'],
        position: obj['position'],
        msg: obj['msg'],
      ));
    }
    return _msgs;
  }
}
