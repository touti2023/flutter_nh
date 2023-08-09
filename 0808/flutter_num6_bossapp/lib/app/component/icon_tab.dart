import 'package:flutter/material.dart';

double _kTextAndIconTabHeight = 53.0;
double _KmarginBottom = 3.0;

class IconTab extends StatefulWidget {
  IconTab({
    required this.text,
    required this.iconUrl,
    required this.color,
  });

  final String text;
  final String iconUrl;
  final Color color;

  @override
  State<IconTab> createState() => _IconTabState();
}

class _IconTabState extends State<IconTab> {
  Widget _buildLabelText() {
    return Text(
      widget.text,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: TextStyle(color: widget.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    double height = _kTextAndIconTabHeight;
    Widget label = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image.network(
              'https://img0.baidu.com/it/u=2264323669,2026521241&fm=253&fmt=auto&app=138&f=JPEG?w=575&h=379'),
          height: 30,
          width: 30,
          margin: EdgeInsets.only(bottom: _KmarginBottom),
        ),
        _buildLabelText()
      ],
    );

    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1,
      ),
    );
  }
}
