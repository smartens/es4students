import 'package:es4students/data/models/models.dart';
import 'package:es4students/data/provider/moodle_client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CourseRepository {
  final MoodleApiClient moodleApiClient;
  SharedPreferences sharedPreferences;

  CourseRepository({@required this.moodleApiClient})
      : assert(moodleApiClient != null);

  Future<List<Course>> getCourseList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    User user = await moodleApiClient.fetchUserData(token);
    return await moodleApiClient.fetchUserCourseList(token, user.userid);
  }

  Future<List<Section>> getCourseSections(String token, int courseid) async {
    return await moodleApiClient.fetchCourseSections(token, courseid);
  }
}
