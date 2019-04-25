import 'package:flutter/material.dart';
import 'package:ES4students/repository/user_repository.dart';

import 'package:ES4students/authentication/authentication_event.dart';
import 'package:ES4students/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'course_tile.dart';

class DashboardPage extends StatefulWidget {
  final UserRepository userRepository;

  DashboardPage({
    Key key,
    @required this.userRepository,
  })  : assert(userRepository != null),
        super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _fullName = '';

  void initState() {
    super.initState();
    if (_fullName.isEmpty) {
      widget.userRepository.getUserData('fullname').then(
              (String s) =>
              setState(() {
                _fullName = s;
              })
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
    BlocProvider.of<AuthenticationBloc>(context);

    ///Methode um Kurse mit DummyData zu generieren
    List<CourseTile> generateDummyData() {
      List<CourseTile> dummyData = new List<CourseTile>();
      for (int i = 1; i < 3; i++) {
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

    List<Widget> generateList() {
      List<Widget> moduleList = new List<Widget>();
      moduleList.addAll(generateDummyData());
      moduleList.addAll([
        Divider(height: 30,),
        Center(
            child: Text(
              'Weitere Kursangebote',
              style: TextStyle(color: Theme
                  .of(context)
                  .primaryColor, fontWeight: FontWeight.bold),
            )
        ),
        CourseTile(
          name: 'Superduperextrakurs',
          description: 'Toller Kurs, den man kaufen soll',
          courseIcon: Icon(Icons.android),
          extraCourse: true,
        ),
      ]);
      return moduleList;
    }

    Widget logoutButton = IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        authenticationBloc.dispatch(LoggedOut());
      },
    );

    return Scaffold(
      body: SafeArea(
        top: true,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text('Übersicht'),
              centerTitle: true,
              actions: <Widget>[logoutButton],
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
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
                              _fullName,
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
              delegate: SliverChildListDelegate(generateList()),
            )
          ],
        ),
      ),
    );
  }
}
