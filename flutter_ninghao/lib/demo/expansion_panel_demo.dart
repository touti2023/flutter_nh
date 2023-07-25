import 'package:flutter/material.dart';

//面板列表项目所需属性
class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    required this.isExpanded,
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  State<ExpansionPanelDemo> createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  //创建面板列表
  late List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionPanelDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExpansionPanelList(
                //切换收缩状态
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                  });
                },
                children: _expansionPanelItems.map((ExpansionPanelItem item) {
                  return ExpansionPanel(
                      isExpanded: item.isExpanded,
                      body: item.body,
                      headerBuilder: ((BuildContext context, isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            item.headerText,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        );
                      }));
                }).toList(),
              ),
            ],
          ),
        ));
  }
}
