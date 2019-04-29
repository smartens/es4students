import 'package:ES4students/bloc/simple_bloc_delegate.dart';
import 'package:ES4students/data/provider/moodle_client.dart';
import 'package:ES4students/data/repository/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ES4students/bloc/authentication/authentication_bloc.dart';
import 'package:ES4students/bloc/authentication/authentication_event.dart';
import 'package:ES4students/bloc/authentication/authentication_state.dart';
import 'package:ES4students/data/repository/user_repository.dart';
import 'package:ES4students/view/dashboard/dashboard_page.dart';
import 'package:ES4students/view/login/login_page.dart';
import 'package:ES4students/view/splash_page.dart';
import 'package:ES4students/view/onboarding_page.dart';

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
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

void main() {
  final UserRepository userRepository = UserRepository(
    moodleApiClient: MoodleApiClient(
      httpClient: http.Client(),
    ),
  );

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(userRepository: userRepository));

  //Backend Testing
/* 
  final CourseRepository courseRepository = CourseRepository(
      moodleApiClient: MoodleApiClient(httpClient: http.Client()));
  print(userRepository.getUserId('124da2c217605ccb2fe6d69782828cad'));
  print(courseRepository.getCourseList('124da2c217605ccb2fe6d69782828cad')); */
}
