import 'package:chooper/data/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(const JsonHolder());
}

class JsonHolder extends StatelessWidget {
  const JsonHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PostApiService.create(),
    dispose: (_,PostApiService service) => service.client.dispose(),
    child: const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    )

    );
  }
}

