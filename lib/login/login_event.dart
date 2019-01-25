import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Basisklasse für Events der Loginoberfläche
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

/// Eventklasse, welche an den Login Bloc weitergeleitet wird, 
/// wenn der Login Button gedrückt wird.
class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}