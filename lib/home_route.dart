import 'package:flutter/material.dart';
import 'login_route.dart';

class HomeRoute extends StatelessWidget {
  static String tag = "home-route";


  @override
  Widget build(BuildContext context) {
    Widget logoutButton = IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginRoute.tag, (_) => false);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ERP4Students"),
        centerTitle: true,
        actions: <Widget>[
          logoutButton,
        ],
      ),
    );
  }
}
