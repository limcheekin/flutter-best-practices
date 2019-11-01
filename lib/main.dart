import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dependencies.dart';
import 'ui/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: 'login',
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
