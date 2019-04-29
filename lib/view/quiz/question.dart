import 'package:flutter/material.dart';

import 'package:es4students/view/quiz/mc_question.dart';
import 'package:es4students/view/quiz/oe_question.dart';

class Question extends StatefulWidget {
  final int number;
  final String qText;

  Question({
    Key key,
    @required this.number,
    @required this.qText,
  }) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool b = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Frage ' + widget.number.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(widget.qText),
              SizedBox(height: 16.0),
              b ? MCQuestion()
                  : OEQuestion(),
            ],
          ),
          Align( //Weiter- & Zurück-Buttons
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  onPressed: () =>
                  {
                    /*...*/
                  },
                  child: Text(
                    'Vorherige Frage',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  onPressed: () =>
                  {
                    /*...*/
                  },
                  child: Text(
                    'Nächste Frage',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}