import 'package:flutter/material.dart';

import 'package:ES4students/view/quiz/quiz_page.dart';

class QuizMainPage extends StatefulWidget {
  final String name;

  QuizMainPage({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  _QuizMainPageState createState() => _QuizMainPageState();
}

class _QuizMainPageState extends State<QuizMainPage> {
  String name = 'Quizname';
  String description = 'Lorem ipsum dolor sit amet, consetetur sadipscing '
      'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna '
      'aliquyam erat, sed diam voluptua.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(description),
            SizedBox(
              height: 8.0,
            ),
            RaisedButton(
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(name: widget.name)))
                  },
              child: Text(
                "Quiz starten",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
