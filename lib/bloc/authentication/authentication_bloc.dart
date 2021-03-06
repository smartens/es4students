import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:es4students/data/repository/user_repository.dart';

import 'package:es4students/bloc/authentication/authentication_event.dart';
import 'package:es4students/bloc/authentication/authentication_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        if (prefs.getBool('firstStart') ?? true) {
          yield FirstStart();
        } else {
          yield AuthenticationUnauthenticated();
        }
      }
    }

    if (event is OnboardingFinished) {
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      //yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      //yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
