import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  const ExpansionPanelListDemo({super.key});

  @override
  State<ExpansionPanelListDemo> createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  late List<int> mList;
  late List<ExpandStateBean> expandeStateList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mList = [];
    expandeStateList = [];
    for (var i = 0; i < 10; i++) {
      mList.add(i);
      expandeStateList.add(ExpandStateBean(false, i));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandeStateList.forEach((element) {
        if (element.index == index) {
          element.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('This is No.${index + 1}'),
                  );
                },
                body: ListTile(
                  title: Text('expansion no.${index + 1}'),
                ),
                isExpanded: expandeStateList[index].isOpen);
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  bool isOpen;
  int index;
  ExpandStateBean(this.isOpen, this.index);
}
