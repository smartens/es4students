import 'package:ES4students/models/models.dart';
import 'package:ES4students/network/moodle_client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseRepository {
  final MoodleApiClient moodleApiClient;
  SharedPreferences sharedPreferences;

  CourseRepository ({@required this.moodleApiClient})
      : assert(moodleApiClient != null);

  Future<AllCourses> getCourseName() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');
    AllCourses allCourses = await moodleApiClient.fetchUserCoursesList(token);
    return allCourses;
  }
}