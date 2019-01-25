import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Repräsentiert den Zustand der Login Komponente
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

/// Initialer Zustand der Login UI
class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

/// Zustand der Login Komponente während der Authentifizierung
class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

/// Zustand der Login Komponente beim Fehlschlagen der Authentifizierung
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'LoginFailure { error: $error }';
}