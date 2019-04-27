import 'dart:async';

import 'package:es4students/data/models/models.dart';
import 'package:es4students/data/providers/moodle_client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseRepository {
  final MoodleApiClient moodleApiClient;
  SharedPreferences prefs;

  CourseRepository({@required this.moodleApiClient})
      : assert(moodleApiClient != null);

  Future<List<Course>> getCourseList() async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');

    User user = await moodleApiClient.fetchUserData(token);

    return await moodleApiClient.fetchUserCourseList(token, user.userid);
  }
}
