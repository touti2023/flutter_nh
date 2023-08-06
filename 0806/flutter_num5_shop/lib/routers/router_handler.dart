import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? goodsId = params['id']?.first;
  if (goodsId == null) {
    // Handle the case where goodsId is null if necessary
    return SizedBox.shrink(); // returning an empty widget for simplicity
  }
  return DetailsPage(goodsId);
});
