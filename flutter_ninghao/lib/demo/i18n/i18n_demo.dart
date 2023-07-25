import 'package:flutter/material.dart';

import 'map/ninghao_demo_localization.dart';

class I18nDemo extends StatelessWidget {
  const I18nDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              //Localizations.of(context, NinghaoDemoLocalizations).title,
              NinghaoDemoLocalizations.of(context)!.title!,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
