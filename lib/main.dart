import 'package:flutter/material.dart';

import 'package:app/view/home_route.dart';
import 'package:app/view/login_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginRoute.tag: (context) => LoginRoute(),
    HomeRoute.tag: (context) => HomeRoute(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginRoute(),
      routes: routes,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(67, 84, 161, 1.0),
      ),
    );
  }
}