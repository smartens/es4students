import 'package:flutter/material.dart';

class MCQuestion extends StatefulWidget {
  MCQuestion({
    Key key,
  }) : super(key: key);

  @override
  _MCQuestionState createState() => _MCQuestionState();
}

class _MCQuestionState extends State<MCQuestion> {
  List<Widget> generateAnswers() {
    List<Widget> answers = new List<Widget>();
    /*answers.addAll(<Widget>[
      Text(
        'Frage ' + widget.number.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.0),
      Text(widget.qText),
      SizedBox(height: 16.0)
    ]);*/
    for (int i = 1; i < 5; i++)
      answers.addAll(<Widget>[
        AnswerTile(number: i),
        SizedBox(height: 8.0),
      ]);
    return answers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: generateAnswers(),
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
        title: Text(widget.number.toString()),
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
