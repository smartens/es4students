import 'package:es4students/data/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CourseListEvent {}

class CourseListLoaded extends CourseListEvent {
  final List<Course> courseList;

  CourseListLoaded({@required this.courseList});

  @override
  String toString() => 'CourseListLoaded';
}
