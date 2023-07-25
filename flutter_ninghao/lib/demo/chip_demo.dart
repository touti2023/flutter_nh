import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tag = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //如果有越界错误可以吧Row换成Wrap，可以自动换行。mainAxisAlignment: MainAxisAlignment.center,要删除。
            //Wrap自带间隔，可以删除下面的 SizedBox(width: 10.0,
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wangzi'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text('giao'),
                  ),
                ),
                Chip(
                  label: Text('qqt'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://c-ssl.dtstatic.com/uploads/item/202004/22/20200422225222_sfubx.thumb.400_0.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tag
                      .map((tag) => Chip(
                            label: Text(tag),
                            onDeleted: () {
                              setState(() {
                                _tag.remove(tag);
                              });
                            },
                          ))
                      .toList(),
                ),
              ],
            ),
            //ActionChip 的用法
            Divider(
              color: Colors.grey,
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ActionChip:$_action'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tag
                  .map((tag) => ActionChip(
                        label: Text(tag),
                        onPressed: () {
                          setState(() {
                            _action = tag;
                          });
                        },
                      ))
                  .toList(),
            ),
            //FilterChip 的用法  选中
            Divider(
              color: Colors.grey,
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: Text('FilterChip:${_selected.toString()}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tag
                  .map((tag) => FilterChip(
                        label: Text(tag),
                        selected: _selected.contains(tag),
                        onSelected: (value) {
                          setState(() {
                            if (_selected.contains(tag)) {
                              _selected.remove(tag);
                            } else {
                              _selected.add(tag);
                            }
                          });
                        },
                      ))
                  .toList(),
            ),
            //ChoiceChip 的用法  选择碎片
            Divider(
              color: Colors.grey,
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ChoiceChip:$_choice'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tag
                  .map((tag) => ChoiceChip(
                        label: Text(tag),
                        selectedColor: Colors.green,
                        selected: _choice == tag,
                        onSelected: (value) {
                          setState(() {
                            _choice = tag;
                          });
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      //重置被删除的tag
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            setState(() {
              _tag = [
                'Apple',
                'Banana',
                'Lemon',
              ];

              _selected = [];
              _choice = 'Lemon';
            });
          }),
    );
  }
}
