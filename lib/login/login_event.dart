import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

/// Dient als Schnittstelle zwischen der Login Bloc Komponente und dem Login UI.
/// Sie repäsentiert die möglichen Events des Login UI.
/// Es wird von [LoginButtonPressed] implementiert.
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

/// Eventklasse, welche ausgelöst wird beim drücken des Login Button.
class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $username}';
}