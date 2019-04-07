import 'package:flutter/material.dart';
import 'package:app/view/onboarding_page.dart';

import 'view/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(67, 84, 161, 1.0),
      ),
    );
  }
}