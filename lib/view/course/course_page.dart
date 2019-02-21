import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final String name;

  CoursePage({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: null,
    );
  }
}
