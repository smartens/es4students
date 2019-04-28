import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:ES4students/view/course/course_page.dart';
import 'package:ES4students/view/course/course_section_tile.dart';

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
              MaterialPageRoute(builder: (context) =>
                  CoursePage(
                    name: name,
                    courseSections: [
                      CourseSectionTile(
                        name: "Vorlesungs- und Übungsmaterialien",
                        description: 'Aktualisierungen und Korrekturen des Skripts<\/b>,\r\n die sich ggf. im Laufe der Vorlesung ergeben, werden in den unten \r\nstehenden Kapitelblöcken zum Download bereitgestellt, sobald die Kapitel\r\n vollständig besprochen wurden. Prüfungsrelevant sind diese \r\nvorlesungsbegleitend bereitgestellten Kapitel.<br><br><p>Die <b>Übungsblätter<\/b> zu den einzelnen Kapiteln werden wöchentlich\r\n in den unten stehenden Blöcken bereit gestellt. Bitte bearbeiten Sie \r\ndie Übungsblätter schon VOR den Besprechungsterminen (soweit der Stoff \r\nbereits in der Vorlesung behandelt wurde). In den Übungsgruppen können \r\nSie Ihre Lösung mit den anderen Übungsteilnehmern und dem Übungsleiter \r\nbesprechen. Falls Sie Fragen zur Lösung der Übungsblätter haben, können \r\nSie auch das Diskussionsforum nutzen<\/p><p><strong>Die Folien zur Vorlesung im Wintersemester 17\/18 stehen hier zum Download zur Verfügung (Änderungen vorbehalten, s. o.). Die Folien werden nach jedem Vorlesungstermin aktualisiert.',
                      ),
                      CourseSectionTile(
                        name: "Multiple-Choice Quiz zum Vorlesungsinhalt",
                        description: "Hier findet ihr Fragenkataloge zum Vorlesungsinhalt, mit denen ihr euren Wissenstands selbstständig überprüfen könnt. Nach Beendigung eines Vorlesungskapitels wird hier jeweils ein Test zum entsprechnenden Kapitel hochgeladen.",
                      )
                    ],
                  ))
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

  _launchURL({String url = 'https://flutter.io'}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}