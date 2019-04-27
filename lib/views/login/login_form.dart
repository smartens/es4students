import 'package:es4students/blocs/authentication/authentication_bloc.dart';
import 'package:es4students/blocs/login/login_bloc.dart';
import 'package:es4students/blocs/login/login_event.dart';
import 'package:es4students/blocs/login/login_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _showValidationError = false;

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        final usernameField = TextFormField(
          keyboardType: TextInputType.text,
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Benutzername",
            border: UnderlineInputBorder(),
          ),
        );

        final passwordField = TextFormField(
          keyboardType: TextInputType.text,
          controller: _passwordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: "Passwort",
            errorText: _showValidationError
                ? "Benutzername oder Passwort falsch"
                : null,
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
          color: Theme.of(context).primaryColor,
          onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
          child: Text(
            "Anmelden",
            style: TextStyle(color: Colors.white),
          ),
        );

        return Form(
          child: Center(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
              children: [
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
                usernameField,
                SizedBox(
                  height: 8.0,
                ),
                passwordField,
                SizedBox(
                  height: 12.0,
                ),
                loginButton,
                Center(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}
