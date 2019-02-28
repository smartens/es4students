import 'dart:async';

import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  // TODO: implement initialState
  get initialState => null;

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
    // TODO: implement mapEventToState
    return;
  }

}