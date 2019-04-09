import 'package:flutter/material.dart';

import 'package:ES4students/pdf_viewer.dart';

class CourseTile extends StatelessWidget {
  CourseTile({Key key, @required this.name, @required this.description})
      : super(key: key);

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          /* ... */
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PDFViewer()
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.book),
                title: Text(name),
                subtitle: Text(description),
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('ABMELDEN'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    FlatButton(
                      child: const Text('ZUM KURS'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
