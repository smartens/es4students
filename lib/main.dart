import 'package:flutter/material.dart';

import 'package:app/view/onboarding_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app/authentication/authentication_bloc.dart';
import 'package:app/authentication/authentication_event.dart';
import 'package:app/authentication/authentication_state.dart';
import 'package:app/repository/user_repository.dart';
import 'package:app/view/profile/profile_page.dart';
import 'package:app/view/login/login_page.dart';
import 'package:app/view/splash_page.dart';

class es4studentsApp extends StatefulWidget {
  final UserRepository userRepository;

  es4studentsApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  _es4studentsAppState createState() => _es4studentsAppState();
}

class _es4studentsAppState extends State<es4studentsApp> {
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is FirstStart) {
              return OnBoardingPage(userRepository: _userRepository,);
            }
            if (state is AuthenticationAuthenticated) {
              return ProfilePage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: _userRepository,);
            }
          },
        ),
        theme: ThemeData(
          primaryColor: Color.fromRGBO(236, 114, 8, 1.0),
        ),
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition.toString());
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(es4studentsApp(userRepository: UserRepository()));
}