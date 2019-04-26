import 'package:ES4students/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ES4students/authentication/authentication_bloc.dart';
import 'package:ES4students/login/login_bloc.dart';
import 'package:ES4students/repository/user_repository.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({
    Key key,
    @required this.userRepository,
  })  : assert(userRepository != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;

  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('es4students'),
          centerTitle: true,
        ),
        body: BlocListener(
          bloc: BlocProvider.of<LoginBloc>(context),
          listener: (BuildContext context, LoginState state) {
            // TODO: implement listener
          },
          child: LoginForm(
            authenticationBloc: _authenticationBloc,
            loginBloc: _loginBloc,
          ),
        ));
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
