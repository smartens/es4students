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
  bool _obscureText = true;



  @override
  Widget build(BuildContext context) {
    final loginNameField = TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Benutzername",
        border: UnderlineInputBorder(),
      ),
    );

    final passwordField = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "Passwort",
        errorText:
        _showValidationError ? "Benutzername oder Passwort falsch" : null,
        border: UnderlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? 'show password' : 'hide password',
          ),
        ),
      ),
    );

    final loginButton = RaisedButton(
      shape: StadiumBorder(),
      color: Color.fromRGBO(67, 84, 161, 1.0),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomeRoute.tag, (_) => false);
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
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
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
            loginNameField,
            SizedBox(
              height: 8.0,
            ),
            passwordField,
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
