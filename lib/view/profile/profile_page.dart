import 'package:flutter/material.dart';

import 'course_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ///Methode um Kurse mit DummyData zu generieren
    List<CourseTile> generateDummyData() {
      List<CourseTile> dummyData = new List<CourseTile>();
      for (int i = 1; i < 10; i++) {
        dummyData.add(
          CourseTile(
            name: ('Kurs ' + i.toString()),
            description: 'Lorem ipsum dolor sit amet, consetetur '
                'sadipscing elitr, sed diam',
          ),
        );
      }
      return dummyData;
    }

    Widget logoutButton = IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        /* ... */
      },
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Übersicht'),
            centerTitle: true,
            actions: <Widget>[
              logoutButton
            ],
            expandedHeight: 256.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 70.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          /*Text(
                            'Profil',
                            style: Theme.of(context).textTheme.headline.apply(
                              fontWeightDelta: 2,
                            ),
                          ),*/
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: Text(
                                "VN",
                                //TODO: Methode zum Generieren der Initialen
                                style: TextStyle(fontSize: 48.0),
                              ),
                              backgroundColor: Colors.white,
                              maxRadius: 56.0,
                            ),
                          ),
                          Text(
                            'Vorname Nachname', //TODO: Verweis für Name
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Student', //TODO: Verweis für Status
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(generateDummyData()),
          )
        ],
      ),
    );
  }
}
