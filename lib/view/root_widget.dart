import 'package:es4students/bloc/authentication/component.dart';
import 'package:es4students/data/providers/moodle_client.dart';
import 'package:es4students/data/repositories/user_repository.dart';
import 'package:es4students/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class RootWidget extends StatelessWidget {
  final UserRepository userRepository = UserRepository(
    moodleApiClient: MoodleApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: AuthenticationBloc(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
