import 'package:flutter/material.dart';
import '../const/const_page.dart';

class RecordingTranslate extends StatefulWidget {
  const RecordingTranslate({super.key});

  @override
  State<RecordingTranslate> createState() => _RecordingTranslateState();
}

class _RecordingTranslateState extends State<RecordingTranslate> {
  List<Translate> _items = [
    Translate(title: 'Darwer', subTitle: '抽屉', isCollection: true),
    Translate(title: 'span', subTitle: '跨度', isCollection: false),
    Translate(title: 'scale', subTitle: '规模', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
    Translate(title: 'title', subTitle: 'subTitle', isCollection: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return _displayList(index);
        },
      ),
    );
  }

  Widget _displayList(int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 2, left: 2, right: 2),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        margin: EdgeInsets.only(left: 8, right: 8),
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            top: 15,
            bottom: 15,
          ),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_flexble(index), _collection(index)],
          ),
        ),
      ),
    );
  }

  Widget _flexble(int index) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          _items[index].title,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          _items[index].subTitle,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ));
  }

  Widget _collection(int index) {
    return IconButton(
        onPressed: () {},
        icon: Icon(_items[index].isCollection ? Icons.star : Icons.star_border,
            size: 25,
            color: _items[index].isCollection
                ? Colors.yellow[600]
                : Colors.black));
  }
}
