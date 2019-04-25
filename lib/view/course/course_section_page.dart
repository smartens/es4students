import 'package:flutter/material.dart';

class CourseSectionPage extends StatelessWidget {
  final String name;

  CourseSectionPage({
    Key key,
    @required this.name,
  })  : assert(name != null),
        super(key: key);

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
