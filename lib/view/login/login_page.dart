import 'package:es4students/bloc/authentication/component.dart';
import 'package:es4students/bloc/login/login_state.dart';
import 'package:es4students/view/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:es4students/bloc/login/login_bloc.dart';
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
    return BlocProvider(
      bloc: LoginBloc(
          userRepository: userRepository,
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
      child: new Scaffold(
        appBar: AppBar(
          title: Text('es4students'),
          centerTitle: true,
        ),
        body: BlocListener(
            bloc: BlocProvider.of<AuthenticationBloc>(context),
            listener: (BuildContext context, AuthenticationState state) {
              if (state is AuthenticationAuthenticated) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DashboardPage(
                          userRepository: userRepository,
                        )));
              }
            },
            child: BlocBuilder(
              bloc: BlocProvider.of<LoginBloc>(context),
              builder: (BuildContext context, LoginState state) {
                if (state is AuthenticationUnauthenticated) {
                  return LoginForm(
                    loginBloc: BlocProvider.of<LoginBloc>(context),
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                  );
                }
              },
            )),
      ),
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
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
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
