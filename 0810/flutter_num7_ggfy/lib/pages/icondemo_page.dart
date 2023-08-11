import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconDemo extends StatefulWidget {
  @override
  State<IconDemo> createState() => _IconDemoState();
}

class _IconDemoState extends State<IconDemo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionButton(
          icon: Icons.camera_alt,
          title: '相机',
        ),
        ActionButton(
          icon: CupertinoIcons.pencil,
          title: '手写',
        ),
        ActionButton(
          icon: Icons.phone,
          title: '对话',
        ),
        ActionButton(
          icon: Icons.keyboard_voice,
          title: '语音',
        )
      ],
    );
  }
}

class ActionButton extends StatefulWidget {
  final String title;
  final IconData icon;

  ActionButton({
    required this.title,
    required this.icon,
  });
  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2))),
      child: Column(
        children: [
          _displayIcon(),
          Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _displayIcon() {
    return Icon(
      widget.icon,
      color: Colors.blue,
      size: 30.0,
    );
  }
}
