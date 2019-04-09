import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:ES4students/repository/user_repository.dart';
import 'package:ES4students/authentication/authentication_bloc.dart';
import 'package:ES4students/authentication/authentication_event.dart';

import 'login_event.dart';
import 'login_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getBool('firstStart' ?? true)) {
        await prefs.setBool('firstStart', false);
      } else {
        await prefs.setBool('firstStart', true);
      }

      yield LoginLoading();

      try {
        /// Token besorgen von Moodle
        final token = await userRepository.authenticate(
            username: event.username, password: event.password);

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
