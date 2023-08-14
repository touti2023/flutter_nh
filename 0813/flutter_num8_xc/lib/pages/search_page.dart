import 'package:flutter/material.dart' hide SearchBar ;
import '../dao/search_dao.dart';
import '../model/search_model.dart';
import '../pages/speak_page.dart';
import '../util/navigator_util.dart';
import '../widget/search_bar.dart';
import '../widget/webview.dart';

const TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];
const URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  const SearchPage(
      {required Key key, required this.hideLeft, this.searchUrl = URL, required this.keyword, required this.hint})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchModel searchModel;
  late String keyword;

  @override
  void initState() {
    if (widget.keyword != null) {
      _onTextChange(widget.keyword);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: searchModel?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return _item(position);
                  }),
            ),
          )
        ],
      ),
    );
  }

  _onTextChange(String text) {
    keyword = text;
    if (text.isEmpty) {
      setState(() {
        searchModel = '' as SearchModel;
      });
      return;
    }
    String url = widget.searchUrl + text;
    SearchDao.fetch(url, text).then((SearchModel model) {
      //只有当当前输入的内容和服务端返回的内容一致时才渲染
      if (model.keyword == keyword) {
        setState(() {
          searchModel = model;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
              padding: EdgeInsets.only(top: 20),
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: SearchBar(
                hideLeft: widget.hideLeft,
                defaultText: widget.keyword,
                hint: widget.hint,
                speakClick: _jumpToSpeak,
                leftButtonClick: () {
                  Navigator.pop(context);
                },
                onChanged: _onTextChange, key:key, inputBoxClick: () {  }, rightButtonClick: () {  },
              )),
        )
      ],
    );
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }

  _item(int position) {
    if (searchModel == null || searchModel.data == null) return null;
    SearchItem item = searchModel.data[position];
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
              url: item.url,
              title: '详情', statusBarColor: '', hideAppBar: null,
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1),
              child: Image(
                  height: 26,
                  width: 26,
                  image: AssetImage(_typeImage(item.type))),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: _title(item),
                ),
                Container(
                    width: 300,
                    margin: const EdgeInsets.only(top: 5),
                    child: _subTitle(item))
              ],
            )
          ],
        ),
      ),
    );
  }

  _typeImage(String type) {
    if (type == null) return 'images/type_travelgroup.png';
    String path = 'travelgroup';
    for (final val in TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return 'images/type_$path.png';
  }

  _title(SearchItem item) {
    if (item == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel.keyword));
    spans.add(TextSpan(
        text: ' ${item.districtname ?? ''} ${item.zonename ?? ''}',
        style: const TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: item.price ?? '',
          style: const TextStyle(fontSize: 16, color: Colors.orange),
        ),
        TextSpan(
          text: ' ${item.star ?? ''}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        )
      ]),
    );
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.isEmpty) return spans;
    //搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle = const TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = const TextStyle(fontSize: 16, color: Colors.orange);
    //'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if ((i + 1) % 2 == 0) {
        //搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + 1), style: keywordStyle));
      }
      String val = arr[i];
      if (val != null && val.isNotEmpty) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
