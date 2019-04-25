import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:ES4students/view/course/course_page.dart';

class CourseTile extends StatelessWidget {
  CourseTile({Key key, @required this.name, @required this.description,
    this.courseIcon, this.extraCourse = false})
      : super(key: key);

  final String name;
  final String description;
  final Icon courseIcon;
  final bool extraCourse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CoursePage(name: name,))
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: courseIcon ?? Icon(Icons.book),
                title: Text(name),
                subtitle: Text(description),
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    /*FlatButton(
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
                    ),*/
                    Container(
                      child: extraCourse
                          ? FlatButton(
                        child: const Text('MEHR INFOS'),
                        onPressed: () {
                          _launchURL();
                        },
                      ) : null,
                    )
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

_launchURL({String url = 'https://flutter.io'}) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}