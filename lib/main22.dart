import 'package:es4students/data/provider/moodle_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:es4students/bloc/authentication/authentication_bloc.dart';
import 'package:es4students/bloc/authentication/authentication_event.dart';
import 'package:es4students/bloc/authentication/authentication_state.dart';
import 'package:es4students/data/repository/user_repository.dart';
import 'package:es4students/views/dashboard/dashboard_page.dart';
import 'package:es4students/views/login/login_page.dart';
import 'package:es4students/views/splash_page.dart';
import 'package:es4students/views/onboarding_page.dart';

class ES4studentsApp extends StatefulWidget {
  final UserRepository userRepository;

  ES4studentsApp({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  ES4studentsAppState createState() => ES4studentsAppState();
}

class ES4studentsAppState extends State<ES4studentsApp> {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: Color.fromRGBO(236, 114, 8, 1.0)));
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
              return OnBoardingPage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: _userRepository);
            }
            if (state is AuthenticationAuthenticated) {
              return DashboardPage(userRepository: _userRepository);
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

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

void main() {
  final UserRepository userRepository = UserRepository(
    moodleApiClient: MoodleApiClient(
      httpClient: http.Client(),
    ),
  );

  BlocSupervisor().delegate = SimpleBlocDelegate();

  runApp(ES4studentsApp(userRepository: userRepository));
}