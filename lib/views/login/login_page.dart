import 'package:es4students/blocs/authentication/component.dart';
import 'package:es4students/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:es4students/blocs/login/login_bloc.dart';
import 'package:es4students/data/repositories/user_repository.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({
    Key key,
    @required this.userRepository,
  })  : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('es4students'),
        centerTitle: true,
      ),
      body: BlocListener(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          listener: (BuildContext context, AuthenticationState state) {
            if (state is LoginFailure) {}
          },
          child: BlocBuilder(
            bloc: BlocProvider.of<AuthenticationBloc>(context),
            builder: (BuildContext context, AuthenticationState state) {
              return Container();
            },
          )),
    );
  }
}

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
