import 'package:es4students/data/models/models.dart';
import 'package:es4students/data/provider/moodle_client.dart';
import 'package:es4students/data/repository/preferences_interface.dart';
import 'package:meta/meta.dart';
import 'dart:async';

class UserRepository {
  final MoodleApiClient moodleApiClient;
  PreferencesInterface preferences;

  UserRepository({@required this.moodleApiClient, @required this.preferences})
      : assert(moodleApiClient != null, preferences != null);

  Future<String> getToken({
    @required String username,
    @required String password,
  }) async {
    if (username.isEmpty && password.isEmpty) {
      return await moodleApiClient.getToken(
          username: "martens", password: "ERP4students!");
    }
    return await moodleApiClient.getToken(
        username: username, password: password);
  }

  Future<void> persistToken(String token) async {
    preferences.initPreferences();
    preferences.token = token;
  }

  Future<void> deleteToken() async {
    preferences.initPreferences();
    preferences.deleteToken();
  }

  Future<bool> hasToken() async {
    preferences.initPreferences();
    return preferences.hasToken;
  }

  Future<int> getUserId(String token) async {
    final User user = await moodleApiClient.fetchUserData(token);
    return user.userid;
  }

  Future<String> getFullName() async {
    final String token = preferences.token;
    User user = await moodleApiClient.fetchUserData(token);
    return user.fullname;
  }

  Future<String> getUserPictureUrl() async {
    final String token = preferences.token;
    User user = await moodleApiClient.fetchUserData(token);
    return user.userpictureurl;
  }
}
