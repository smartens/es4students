import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  static String tag = "home-route";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERP4Students"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),

    );
  }
}
