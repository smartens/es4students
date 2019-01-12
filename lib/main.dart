import 'package:flutter/material.dart';
import 'login_route.dart';
import 'home_route.dart';

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
    );
  }
}