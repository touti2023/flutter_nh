import 'dart:async';

import 'package:flutter/services.dart';

class FlutterToast {
  static const MethodChannel _channel =
      const MethodChannel('com.dn/flutter_toast');

  static Future<Null> showToast(String msg,
      {String duration, int textColor, double textSize}) async {
    _channel.invokeMethod('showToast', {
      'msg': msg,
      'duration': duration,
      'textColor': textColor,
      'textSize': textSize,
    });
    return null;
  }
}
