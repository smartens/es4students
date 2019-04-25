// Encoders and decoders for converting between different data representations, including JSON and UTF-8.
// https://api.dartlang.org/stable/2.2.0/dart-convert/dart-convert-library.html
import 'dart:async';
import 'dart:convert';

// A composable, Future-based library for making HTTP requests.
// https://pub.dartlang.org/packages/http
import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

import 'package:ES4students/models/models.dart';

class MoodleApiClient {
  static const baseUrl = 'https://es4students.de/elearning';
  static const moodleService = 'moodle_mobile_app';
  static const restFormat = 'json';
  final http.Client httpClient;

  MoodleApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> getToken({
    @required String username,
    @required String password,
  }) async {
    final tokenUrl =
        '$baseUrl/login/token.php?username=$username&password=$password&service=$moodleService';
    final tokenResponse = await this.httpClient.get(tokenUrl);

    if (tokenResponse.statusCode != 200) {
      throw Exception('Error getting token');
    }

    final tokenJson = jsonDecode(tokenResponse.body);
    return tokenJson['token'];
  }

  Future<User> fetchUserData(String token) async {
    final wsfunction = 'core_webservice_get_site_info';
    final userDataUrl =
        '$baseUrl/webservice/rest/server.php?wstoken=$token&wsfunction=$wsfunction&moodlewsrestformat=$restFormat';

    final userDataReponse = await this.httpClient.get(userDataUrl);

    if (userDataReponse.statusCode != 200) {
      throw Exception('Error getting userData');
    }

    Map userDataMap = jsonDecode(userDataReponse.body);
    return User.fromJson(userDataMap);
  }

  Future<List<Course>> fetchUserCoursesList(String token, int userid) async {
    final wsfunction = 'core_enrol_get_users_courses';
    final userCoursesDataUrl =
        '$baseUrl/webservice/rest/server.php?wstoken=$token&wsfunction=$wsfunction&moodlewsrestformat=$restFormat&userid=$userid';

    final userCoursesListResponse =
        await this.httpClient.get(userCoursesDataUrl);

    if (userCoursesListResponse.statusCode != 200) {
      throw Exception('Error getting userCoursesList');
    }

    Iterable list = jsonDecode(userCoursesListResponse.body);
    List<Course> userCoursesList =
        list.map((course) => Course.fromJson(course)).toList();
    return userCoursesList;
  }

  Future<List<Section>> fetchCourseSections(String token, int courseid) async {
    final wsfunction = 'core_course_get_contents';
    final url =
        '$baseUrl/webservice/rest/server.php?wstoken=$token&wsfunction=$wsfunction&moodlewsrestformat=$restFormat&userid=$courseid';
    
    final courseSectionsListResponse = await this.httpClient.get(url);

    if (courseSectionsListResponse.statusCode != 200) {
      throw Exception('Error getting Course Sections');
    }

    Iterable list = jsonDecode(courseSectionsListResponse.body);
    List<Section> courseSectionsList = list.map((section) => Section.fromJson(section)).toList();
    return courseSectionsList;
  }
}
