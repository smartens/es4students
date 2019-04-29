import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
        tag: 'logo',
        child: Image.asset(
          'images/erp4students_logo.png',
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
