import 'package:flutter/material.dart';

import 'package:es4students/view/quiz/question.dart';

class QuizPage extends StatefulWidget {
  final String name;

  QuizPage({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Question(
          number: 1,
          qText: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
              'sed diam?'),
    );
  }
}
