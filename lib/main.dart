import 'package:chooper/data/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  _setupLogging();
  runApp(JsonHolder());
}

void _setupLogging() {
  // Logger.level = Level.debug;
  // print(Logger.level.index);
  // Logger.root.level = Level.ALL;
  // Logger.root.onRecord.listen((rec) {
  //   print('${rec.level.name}: ${rec.time}: ${rec.message}');
  //
  // });
}
class JsonHolder extends StatelessWidget {
  const JsonHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PostApiService.create(),
        dispose: (_, PostApiService service) => service.client.dispose(),
        child: MaterialApp(
          title: 'Material App',
          home: HomePage(),
        ));
  }
}
