// Dart imports
import 'dart:async';

// internal imports
import 'package:es4students/data/repositories/user_repository.dart';
import 'package:es4students/bloc/authentication/component.dart';

// Third party imports
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  /* final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null); */

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedtoState();
    }

    if (event is OnboardingFinished) {
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      //yield AuthenticationLoading();
      //await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      //yield AuthenticationLoading();
      //await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }

    if (event is LogIn) {
      yield AuthenticationAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapAppStartedtoState() async* {
    //final bool hasToken = await userRepository.hasToken();

    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //if (hasToken) {
    //  yield AuthenticationAuthenticated();
    //} else {
    //  if (sharedPreferences.getBool('firstStart') ?? true) {
    //    yield FirstStart();
    //  } else {
    yield AuthenticationUnauthenticated();
    //  }
    //}
  }
}
