import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_vo.dart';

class ContactSiderList extends StatefulWidget {
  final List<ContactVO> items;
  final IndexedWidgetBuilder headerBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList(
      {required this.items,
      required this.headerBuilder,
      required this.itemBuilder,
      required this.sectionBuilder});

  @override
  State<ContactSiderList> createState() => _ContactSiderListState();
}

class _ContactSiderListState extends State<ContactSiderList>
    implements SectionInderxer {
  Color _pressColor = Colors.transparent;

  final ScrollController _scrollController = ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener(
              onNotification: _onNotification,
              child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          _isShowHeaderView(index),
                          Offstage(
                            offstage: _shouldShowHeader(index),
                            child: widget.sectionBuilder(context,index),
                          ),
                          Column(
                            children: [
                              widget.itemBuilder(context,index),
                            ],
                          ),
                        ],
                      ),
                    );
                  })),
          //排序字幕
          Positioned(
            right: 0,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: 32,
                color: _pressColor,
                child: GestureDetector(
                  onTapDown: (TapDownDetails t){
                    setState(() {
                      _pressColor = Colors.grey;
                    });
                  },
                  //
                  onTapUp: (TapUpDetails t){
                    setState(() {
                      _pressColor = Colors.transparent;
                    });
                  },
                  //
                  onVerticalDragStart: (DragStartDetails details){
                    setState(() {
                      _pressColor = Colors.grey;
                    });
                  },
                  //
                  onVerticalDragEnd: (DragEndDetails details){
                    setState(() {
                      _pressColor = Colors.transparent;
                    });
                  },
                  //
                  onVerticalDragUpdate: (DragUpdateDetails details){

                  },
                  child: ListView.builder(
                    controller: ScrollController(),
                    itemCount: siderBarKey.length,
                      itemBuilder: (context,index){
                      return Container(
                        alignment: Alignment.center,
                        height: 17,
                          child: Text(siderBarKey[index]),
                      );
                      }),
                ),
              ))
        ],
      ),
    );
  }

  @override
  listScrollToPosition(index){
    //重要方：根据华东的字母返回listview中的位置。
    for(var i = 0; i < widget.items.length;i++){
      if(siderBarKey[index] =="*" || siderBarKey[index] == "^"){
        _scrollController.jumpTo(0);
        setState(() {

        });
        return -1;
      } else if(widget.items[i].seationKey == siderBarKey[index]){
        return i;
      }
    }
    return -1;
  }

  bool _shouldShowHeader(int position) {
    if (position < 0) {
      return false;
    }

    if (position == 0) {
      return false;
    }

    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }
}

abstract class SectionInderxer {
  listScrollToPosition(index);
}

const siderBarKey = <String>[
  "^",
  "*",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#",
];
