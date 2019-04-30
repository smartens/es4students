abstract class PreferencesInterface {
  Future initPreferences();

  String get token;
  set token(String token);
  deleteToken();
  bool get hasToken;
}
