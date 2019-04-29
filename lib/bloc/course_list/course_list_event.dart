import 'package:es4students/data/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CourseListEvent {}

class LoadCourseList extends CourseListEvent {
  @override
  String toString() => 'LoadCourseList';
}
/* 
class LoadedCourseList extends CourseListEvent {
  final List<Course> courseList;

  LoadedCourseList({@required this.courseList});

  @override
  String toString() => 'CourseListLoaded';
}
 */
