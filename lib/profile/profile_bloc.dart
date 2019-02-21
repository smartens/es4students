import 'package:bloc/bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  // TODO: implement initialState
  get initialState => null;

  @override
  Stream<ProfileState> mapEventToState(
      ProfileState currentState, ProfileEvent event) async* {
    // TODO: implement mapEventToState
    return;
  }
}
