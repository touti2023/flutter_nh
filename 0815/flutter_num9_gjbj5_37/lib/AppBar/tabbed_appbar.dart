import 'package:flutter/material.dart';

class TabbedAppBarSample extends StatelessWidget {
  const TabbedAppBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Tabbed AppBar'),
              bottom: TabBar(
                  isScrollable: true,
                  tabs: choices.map((Choice choice){
                    return Tab(
                      text: choice.title,
                      icon: Icon(choice.icon),
                    );
                  }).toList()),
            ),
            body: TabBarView(children: choices.map((Choice choice){
              return Padding(padding: EdgeInsets.all(16),
              child: ChoiceCard(choice:choice),);
            }).toList()),
          )),
    );
  }
}

class Choice{
  final String title;
  final IconData icon;
  Choice({required this.title,required this.icon});
}

List<Choice> choices=<Choice>[
  Choice(title: 'CAR',icon: Icons.directions_car),
  Choice(title: 'CAR',icon: Icons.directions_bike),
  Choice(title: 'CAR',icon: Icons.directions_boat),
  Choice(title: 'CAR',icon: Icons.directions_bus),
  Choice(title: 'CAR',icon: Icons.directions_railway),
  Choice(title: 'CAR',icon: Icons.directions_walk),
];

class ChoiceCard extends StatefulWidget {
  final Choice choice;

  ChoiceCard({required this.choice});

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme
        .of(context)
        .textTheme
        .displaySmall;

    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget. choice.icon, size: 128, color: textStyle?.color,),
            Text(widget. choice.title, style: textStyle,)
          ],
        ),
      ),
    );
  }
}






