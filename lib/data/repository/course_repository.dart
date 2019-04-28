import 'package:ES4students/data/models/models.dart';
import 'package:ES4students/data/provider/moodle_client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CourseRepository {
  final MoodleApiClient moodleApiClient;

  CourseRepository({@required this.moodleApiClient})
      : assert(moodleApiClient != null);

  Future<List<Course>> getCourseList(String token) async {
    return await moodleApiClient.fetchUserCourseList(token);
  }
}
