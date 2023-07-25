import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  const StreamDemoHome({Key? key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  late StreamSubscription _streamSubscription;
  // ignore: close_sinks
  late StreamController<String> _streamDemo;
  late StreamSink _sinkdemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Create a steam.');
    //Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast();
    _sinkdemo = _streamDemo.sink;

    print('Start listening on a stream.');
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    print('Initalize completed.');
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo $data');
  }

  void onError(error) {
    print('Errpr:$error');
  }

  void onDone() {
    print('Done');
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamSubscription.pause(); //停止监听/订阅（停止后可以恢复）
  }

  void _resumeStream() {
    print('resume subscription');
    _streamSubscription.resume(); //恢复监听/订阅
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streamSubscription.cancel(); //取消监听/订阅取消后无法恢复）
  }

  void _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
    //_streamDemo.add(data);
    _sinkdemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //模拟一个异常
    //throw 'Somethinng happened';
    return 'hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Text(_data),
        StreamBuilder(
            stream: _streamDemo.stream,
            initialData: '...',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _addDataToStream, child: Text('Add')),
            ElevatedButton(onPressed: _pauseStream, child: Text('Pause')),
            ElevatedButton(onPressed: _resumeStream, child: Text('resume')),
            ElevatedButton(onPressed: _cancelStream, child: Text('cancel')),
          ],
        ),
      ],
    )));
  }
}
