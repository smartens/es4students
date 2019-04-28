import 'package:es4students/bloc/authentication/component.dart';
import 'package:es4students/data/providers/moodle_client.dart';
import 'package:es4students/data/repositories/user_repository.dart';
import 'package:es4students/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class RootWidget extends StatefulWidget {
  final UserRepository _userRepository = UserRepository(
    moodleApiClient: MoodleApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc();
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: AuthenticationBloc(),
      child: MaterialApp(
        home: LoginPage(
          userRepository: widget._userRepository,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }
}
