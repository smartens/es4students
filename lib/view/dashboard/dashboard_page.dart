import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:es4students/bloc/authentication/authentication_event.dart';
import 'package:es4students/bloc/authentication/authentication_bloc.dart';
import 'package:es4students/data/repository/user_repository.dart';
import 'package:es4students/view/profile_page.dart';

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
  String _userPictureURL = '';

  DateTime currentBackPressTime = DateTime.now();

  void initState() {
    super.initState();
    if (_fullName.isEmpty) {
      widget.userRepository.getFullName().then((String s) => setState(() {
            _fullName = s;
          }));
    }
    if (_userPictureURL.isEmpty) {
      widget.userRepository.getUserPictureUrl().then((String s) => setState(() {
            _userPictureURL = s;
          }));
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
        Divider(
          height: 30,
        ),
        Center(
            child: Text(
          'Weitere Kursangebote',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        )),
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
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Color.fromRGBO(236, 114, 8, 1.0),
            elevation: 0.0,
          ),
          preferredSize: Size.fromHeight(0.0)),
      body: WillPopScope(
        onWillPop: () => onWillPop(),
        child: SafeArea(
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
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage(
                                                userRepository:
                                                    widget.userRepository,
                                              ))),
                                  child: CircleAvatar(
                                    backgroundImage: _userPictureURL.isNotEmpty
                                        ? NetworkImage(_userPictureURL)
                                        : AssetImage(
                                            "images/default_profile_pic.jpeg"),
                                    backgroundColor: Colors.white,
                                    maxRadius: 56.0,
                                  ),
                                ),
                              ),
                              Text(
                                _fullName,
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.white),
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
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Erneut \'Zurück\' drücken, um App zu beenden',
        toastLength: Toast.LENGTH_LONG,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
