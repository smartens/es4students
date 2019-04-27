import 'package:flutter/material.dart';

import 'package:es4students/views/course/course_section_page.dart';

class CourseSectionTile extends StatelessWidget {
  final String name;
  final String description;

  CourseSectionTile({
    Key key,
    @required this.name,
    this.description,
  })  : assert(name != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseSectionPage(name: name)));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(name),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 8.0, bottom: 16.0),
                child: Text(description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
