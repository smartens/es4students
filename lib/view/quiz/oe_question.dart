import 'package:flutter/material.dart';

class OEQuestion extends StatefulWidget {
  OEQuestion({Key key, q}) : super(key: key);

  @override
  _OEQuestionState createState() => _OEQuestionState();
}

class _OEQuestionState extends State<OEQuestion> {
  TextEditingController answerField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 32.0,
        ),
        TextField(
          controller: TextEditingController(),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ],
    );
  }
}
