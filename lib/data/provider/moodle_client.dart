// Encoders and decoders for converting between different data representations, including JSON and UTF-8.
// https://api.dartlang.org/stable/2.2.0/dart-convert/dart-convert-library.html
import 'dart:async';
import 'dart:convert';

// A composable, Future-based library for making HTTP requests.
// https://pub.dartlang.org/packages/http
import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

import 'package:es4students/data/models/models.dart';

class MoodleApiClient {
  static const baseUrl = 'https://es4students.de/elearning';
  static const moodleService = 'moodle_mobile_app';
  static const restFormat = 'json';
  final http.Client httpClient;
  static int userid;

  MoodleApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> getToken({
    @required String username,
    @required String password,
  }) async {
    final url =
        '$baseUrl/login/token.php?username=$username&password=$password&service=$moodleService';
    final tokenResponse = await this.httpClient.get(url);

    final tokenJson = jsonDecode(tokenResponse.body);

    if (tokenJson['token'] != null) {
      return tokenJson['token'];
    } else {
      throw new Exception("Username / Passwort ist falsch!");
    }
  }

  Future<User> fetchUserData(String token) async {
    final wsfunction = 'core_webservice_get_site_info';
    final url =
        '$baseUrl/webservice/rest/server.php?wstoken=$token&wsfunction=$wsfunction&moodlewsrestformat=$restFormat';

    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting userData');
    }

    Map userDataMap = jsonDecode(response.body);
    userid = userDataMap['userid'];

    return User.fromJson(userDataMap);
  }

  Future<List<Course>> fetchUserCourseList(String token, int userid) async {
    final wsfunction = 'core_enrol_get_users_courses';

    final userCoursesDataUrl =
        '$baseUrl/webservice/rest/server.php?wstoken=$token&wsfunction=$wsfunction&moodlewsrestformat=$restFormat&userid=$userid';

    final response = await this.httpClient.get(userCoursesDataUrl);

    if (response.statusCode != 200) {
      throw Exception('Error getting userCoursesList');
    }

    Iterable list = jsonDecode(response.body);

    print(list);

    List<Course> h = list.map((i) => Course.fromJson(i)).toList();
    print(h);
    for (var course in h) {
      print(course.shortname);
    }
    return h;
  }

  Future<List<Section>> fetchCourseSections(String token, int courseid) async {
    final wsfunction = 'core_course_get_contents';
    final url =
        '$baseUrl/webservice/rest/server.php?wstoken=$token&wsfunction=$wsfunction&moodlewsrestformat=$restFormat&userid=$courseid';

    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting Course Sections');
    }

    Iterable list = jsonDecode(response.body);
    List<Section> courseSectionsList =
        list.map((section) => Section.fromJson(section)).toList();
    return courseSectionsList;
  }
}
