import 'package:ES4students/data/models/models.dart';
import 'package:ES4students/data/provider/moodle_client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CourseRepository {
  final MoodleApiClient moodleApiClient;
  SharedPreferences sharedPreferences;

  CourseRepository({@required this.moodleApiClient})
      : assert(moodleApiClient != null);

  Future<AllCourses> getCourseName() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');
    AllCourses allCourses = await moodleApiClient.fetchUserCoursesList(token);
    return allCourses;
  }
}
