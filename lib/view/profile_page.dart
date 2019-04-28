import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ES4students/bloc/authentication/authentication_event.dart';
import 'package:ES4students/bloc/authentication/authentication_bloc.dart';
import 'package:ES4students/data/repository/user_repository.dart';

class ProfilePage extends StatefulWidget {
  final UserRepository userRepository;

  ProfilePage({
    Key key,
    @required this.userRepository,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _fullName = '';
  String _userPictureURL = '';

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

    Widget logoutButton = IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        authenticationBloc.dispatch(LoggedOut());
      },
    );

    List<Widget> generateProfileList() {
      List<Widget> profileItems = new List<Widget>();
      profileItems.addAll([
        ListTile(
          title: Text(
            'E-Mail-Adresse',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('max.mustermann@online.de'),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Stadt',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Lorem Ipsum'),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Land',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Lorem Ipsum'),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Beschreibung',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Lorem ipsum dolor sit amet, '
              'consetetur sadipscing elitr, sed diam'),
        ),
      ]);
      return profileItems;
    }

    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Color.fromRGBO(236, 114, 8, 1.0),
            elevation: 0.0,
          ),
          preferredSize: Size.fromHeight(0.0)),
      body: SafeArea(
        top: true,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text('Profil'),
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
                              child: CircleAvatar(
                                backgroundImage: _userPictureURL.isNotEmpty
                                    ? NetworkImage(_userPictureURL)
                                    : AssetImage(
                                        "images/default_profile_pic.jpeg"),
                                backgroundColor: Colors.white,
                                maxRadius: 56.0,
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
              delegate: SliverChildListDelegate(generateProfileList()),
            )
          ],
        ),
      ),
    );
  }
}
