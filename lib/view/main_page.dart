import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //final AuthenticationBloc authenticationBloc =
    //  BlocProvider.of<AuthenticationBloc>(context);

    Widget logoutButton = IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        //authenticationBloc.dispatch(LoggedOut());
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Übersicht"),
        centerTitle: true,
        actions: <Widget>[
          logoutButton,
        ],
      ),
    );
  }
}
