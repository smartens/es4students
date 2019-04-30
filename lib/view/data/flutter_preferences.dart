import 'package:es4students/data/repository/preferences_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterPreferences extends PreferencesInterface {
  SharedPreferences sharedPreferences;

  @override
  Future initPreferences() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  @override
  String get token => sharedPreferences.getString('token');

  @override
  set token(String token) => sharedPreferences.setString('token', token);

  @override
  deleteToken() => sharedPreferences.remove('token');

  @override
  bool get hasToken =>
      sharedPreferences.getString('token') != null ? true : false;
}
