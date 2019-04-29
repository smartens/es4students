import 'package:es4students/data/models/models.dart';
import 'package:es4students/data/provider/moodle_client.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final MoodleApiClient moodleApiClient;
  SharedPreferences sharedPreferences;

  UserRepository(
      {@required this.moodleApiClient, @required this.sharedPreferences})
      : assert(moodleApiClient != null, sharedPreferences != null);

  Future<String> getToken({
    @required String username,
    @required String password,
  }) async {
    if (username.isEmpty && password.isEmpty) {
      return await moodleApiClient.getToken(
          username: "martens", password: "ERP4students!");
    } else {
      return await moodleApiClient.getToken(
            username: username, password: password);
    }
  }

  Future<void> persistToken(String token) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    return;
  }

  Future<void> deleteToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
  }

  Future<bool> hasToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> getUserId(String token) async {
    User user = await moodleApiClient.fetchUserData(token);

    return user.userid;
  }

  Future<String> getFullName() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');

    User user = await moodleApiClient.fetchUserData(token);

    return user.fullname;
  }

  Future<String> getUserPictureUrl() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String token = sharedPreferences.get('token');

    User user = await moodleApiClient.fetchUserData(token);

    return user.userpictureurl;
  }
}
