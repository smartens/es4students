import 'package:flutter/material.dart';

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
  List<Widget> generateQuestion() {
    List<Widget> answers = new List<Widget>();
    answers.addAll(<Widget>[
      Text(
        'Frage ' + widget.number.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.0),
      Text(widget.qText),
      SizedBox(height: 16.0)
    ]);
    for (int i = 1; i < 5; i++)
      answers.addAll(<Widget>[
        AnswerTile(number: i),
        SizedBox(height: 8.0),
      ]);
    return answers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: generateQuestion(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  //shape: StadiumBorder(),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => {
                        /*...*/
                      },
                  child: Text(
                    'Vorherige Frage',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  //shape: StadiumBorder(),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => {
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

class AnswerTile extends StatefulWidget {
  final int number;

  AnswerTile({Key key, @required this.number}) : super(key: key);

  @override
  _AnswerTileState createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {
  bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
            setState(() {
              _checked = !_checked;
            })
          },
      child: ListTile(
        title: Text('Antwort ' + widget.number.toString()),
        subtitle: Text('Lorem ipsum dolor sit amet, consetetur sadipscing'
            ' elitr, sed diam'),
        trailing: _checked
            ? Icon(
                Icons.check_box,
                color: Theme.of(context).primaryColor,
              )
            : Icon(Icons.check_box_outline_blank),
      ),
    );
  }
}
