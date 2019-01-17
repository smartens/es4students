import 'package:flutter/material.dart';
import 'home_route.dart';

class LoginRoute extends StatefulWidget {
  static String tag = "login-route";

  @override
  _LoginRouteState createState() => new _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  /// Bei falscher Benutzerkennung oder Passwort auf 'true' setzen
  bool _showValidationError = false;

  @override
  Widget build(BuildContext context) {
    final loginName = TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Benutzername",
        //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: UnderlineInputBorder(),
      ),
    );

    final password = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Passwort",
        errorText:
        _showValidationError ? "Benutzername oder Passwort falsch" : null,
        //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: UnderlineInputBorder(),
      ),
    );

    final loginButton = RaisedButton(
      shape: StadiumBorder(),
      color: Color.fromRGBO(67, 84, 161, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamed(HomeRoute.tag);
      },
      child: Text(
        "Anmelden",
        style: TextStyle(color: Colors.white),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ERP4Students"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(67, 84, 161, 1.0),
      ),
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          //shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 48.0),
          children: <Widget>[
            Image.asset(
              'images/erp4students_logo.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Melden Sie sich mit\nIhrer Benutzerkennung an",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12.0,
            ),
            loginName,
            SizedBox(
              height: 8.0,
            ),
            password,
            SizedBox(
              height: 12.0,
            ),
            loginButton,
          ],
        ),
      ),
    );
  }
}
