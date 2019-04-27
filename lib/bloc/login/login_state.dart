import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Dient als Schnittstelle zwischen der Login Bloc Komponente und dem Login UI.
/// Es repräsentiert den Zustand des Login UI.
/// Es wird von den Klassen [LoginInitial], [LoginLoading], [LoginFailure] 
/// implementiert.
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

/// Initialer Zustand der Login UI
class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

/// Zustand des Login UI während der Authentifizierung
class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

/// Zustand des Login UI beim Fehlschlagen der Authentifizierung
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'LoginFailure { error: $error }';
}